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
    Chemistry::Mol                  0.25
    Chemistry::MacroMol             0.06
    Chemistry::InternalCoords       0.16
    Chemistry::Ring                 0.15
    Chemistry::Canonicalize         0.10
    Chemistry::Pattern              0.21
    Chemistry::Bond::Find           0.21
    Chemistry::File::MDLMol         0.16
    Chemistry::File::SMILES         0.41
    Chemistry::File::PDB            0.20
    Chemistry::MidasPattern         0.10
    Chemistry::File::Mopac          0.15
    Chemistry::File::SMARTS         0.11
    Chemistry::File::XYZ            0.10
    Chemistry::Mok                  0.22
));

check_nmake();

&WriteAll();


