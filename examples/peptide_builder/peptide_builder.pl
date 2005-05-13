#!/home/ivan/bin/perl
# usage: ./pep.pl <SEQUENCE>
# prints an mdl molfile to stdout

# curent version only supports the residues A,G,L,V
# the residues are assumed to be in the files listed below in %files,
# which must have the atoms N, CA, and C as the first three atoms in the 
# file

use strict;
use warnings;
#use diagnostics;

use Chemistry::File::MDLMol;
use Chemistry::File::SMARTS;
use Chemistry::Pattern;
use Chemistry::InternalCoords::Builder qw(build_zmat);

{
    my %files = (
        A => 'ala.mol',
        V => 'val.mol',
        G => 'gly.mol',
        L => 'leu.mol',
    );

    my $patt = Chemistry::Pattern->parse('C((=O)CN([C,H])[H])O[H]', 
        format => 'smarts');

    my %aa;

    my ($c, $o, $ca, $n, $hn);

    sub amino_acid {
        my ($code) = @_;
        return $aa{$code} if $aa{$code};
        my $file = $files{$code} or die "unknown code '$code', stopping ";
        $aa{$code} = Chemistry::Mol->read($file);
    }

    sub start_chain {
        my ($res) = @_;
        my $chain = safe_clone($res);
        $patt->match($chain) or die "didn't match, stopping ";
        my ($oh, $ho, $hnb);
        ($c, $o, $ca, $n, $hn, $hnb, $oh, $ho) = $patt->atom_map;
        $oh->delete; $ho->delete;
        build_zmat($chain, bfs => 0);
        $chain;
    }

    sub add_residue {
        my ($chain, $res) = @_;
        $res = safe_clone($res);

        $patt->match($res) or die "didn't match, stopping ";
        my @map = $patt->atom_map;
        $_->delete for splice @map, 5;
        build_zmat($res, bfs => 0);

        $chain->combine($res);
        my ($c2, $o2, $ca2, $n2, $hn2) = 
            map { $chain->by_id($_->id) } @map;

        $chain->new_bond(atoms => [$n2, $c], order => 1);
        $n2 ->internal_coords($c, 1.5, $ca, 120, $o, 180);
        $ca2->internal_coords($n2, 1.5, $c, 120, $ca, 180);
        $c2 ->internal_coords($ca2, 1.5, $n2, 120, $c, 180);
        $hn2->internal_coords($n2, 1.1, $c, 120, $o, 180)
            if $hn2->symbol eq 'H'; # make sure it's not Proline
        ($c, $o, $ca, $n, $hn) = ($c2, $o2, $ca2, $n2, $hn2);
    }

    sub end_chain {
        my ($chain) = @_;
        my $ox = $chain->new_atom(
            symbol => 'O', 
            internal_coords => [ $c, 1.5, $ca, 120, $o, 180 ]
        );
        my $h = $chain->new_atom(
            symbol => 'H', 
            internal_coords => [ $ox, 1.1, $c, 105, $o, 0 ]
        );
        $chain->new_bond(atoms => [$ox, $c], order => 1);
        $chain->new_bond(atoms => [$ox, $h], order => 1);
        $_->internal_coords->add_cartesians for $chain->atoms;
    }

}

sub safe_clone {
    my ($mol) = @_;
    my $clone = $mol->clone;
    for ($clone, $clone->atoms, $clone->bonds) {
        $_->id($_->nextID);
    }
    $clone;
}

sub build_sequence {
    my ($s) = @_;
    $s or die "no sequence, stopping ";
    my @seq = split //, $s;

    my $code = shift @seq;
    my $res = amino_acid($code);

    my $chain = start_chain($res);
    $chain->name($s);

    for my $code (@seq) {
        $res = amino_acid($code);
        add_residue($chain, $res);
    }
    end_chain($chain);

    return $chain;
}


##############################33

my $chain = build_sequence(shift);
print $chain->print(format => 'mdl');

