use strict;
use warnings;
#use diagnostics;
use inc::Module::Install;

name('PerlMol');
author('Ivan Tubert-Brohman <itub@cpan.org>');
abstract('Perl modules for chemoinformatics and computational chemistry');
license('perl');
version_from('PerlMol.pm');

requires(qw(
    perl                5.006
    Test::Simple        0.45
    Scalar::Util        1.07
    Storable            2.04
    Text::Balanced      1.89
));

bundle(qw(
    Math::VectorReal                1.02
    Statistics::Regression          0.15
    Chemistry::Mol                  0.24
    Chemistry::MacroMol             0.05
    Chemistry::InternalCoords       0.11
    Chemistry::Ring                 0.11
    Chemistry::Canonicalize         0.10
    Chemistry::Pattern              0.21
    Chemistry::Bond::Find           0.21
    Chemistry::File::MDLMol         0.15
    Chemistry::File::SMILES         0.40
    Chemistry::File::PDB            0.15
    Chemistry::File::Mopac          0.10
    Chemistry::File::SMARTS         0.10
    Chemistry::Mok                  0.21
));

check_nmake();

&WriteAll();


__END__
# dirty hack to make sure Scalar-List-Utils tests pass
# mkdir "Scalar-List-Utils-1.14/blib", 0755;

