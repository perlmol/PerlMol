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
    perl 5.006
));

bundle(qw(
    Test::Simple                    0.47
    Scalar::Util                    1.14
    Storable                        2.12
    Text::Balanced                  1.95
    Math::VectorReal                1.02
    Chemistry::Mol                  0.23
    Chemistry::MacroMol             0.05
    Chemistry::InternalCoords       0.11
    Chemistry::File::MDLMol         0.15
    Chemistry::File::SMILES         0.33
    Chemistry::File::PDB            0.10
    Chemistry::File::Mopac          0.10
    Chemistry::Pattern              0.20
    Chemistry::Bond::Find           0.20
    Chemistry::Mok                  0.20
));

# dirty hack to make sure Scalar-List-Utils tests pass
mkdir "Scalar-List-Utils-1.14/blib", 0755;

check_nmake();

&WriteAll();

