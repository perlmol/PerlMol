package PerlMol;

$VERSION = '0.2300';

1;

__END__

=head1 NAME

PerlMol - Perl modules for molecular chemistry

=head1 SYNOPSIS

    # This is a bundle containing all of the modules
    # of the PerlMol Project and their dependencies.
    # This is not a real module; it is the main index
    # to the documentation of the PerlMol modules.

=head1 DESCRIPTION

PerlMol is a collection of Perl modules for chemoinformatics and computational
chemistry with the philosophy that "simple things should be simple". It should
be possible to write one-liners that use this toolkit to do meaningful
"molecular munging". The perlmol toolkit provides objects and methods for
representing molecules, atoms, and bonds in Perl; doing substructure matching;
and reading and writing files in various formats.

=head1 DOCUMENTATION

What follows is an index of the relevant documentation.

=head2 Tutorial

L<Chemistry::Tutorial>

=head2 Object oriented modules

The following modules are indented according to the class hierarchy:

=over

=item L<Chemistry::Obj>

=over

=item L<Chemistry::Mol>

=over

=item L<Chemistry::Pattern>

=item L<Chemistry::Domain>

=item L<Chemistry::MacroMol>

=item Chemistry::Ring (coming soon)
        
=back

=item L<Chemistry::Atom>
        
=over

=item L<Chemistry::Pattern::Atom>
        
=back

=item L<Chemistry::Bond>
        
=over

=item L<Chemistry::Pattern::Bond>

=back
        
=back
    
=item L<Chemistry::File>
    
=over 

=item L<Chemistry::File::Formula>

=item L<Chemistry::File::MDLMol>

=item L<Chemistry::File::Mopac>

=item L<Chemistry::File::PDB>

=item L<Chemistry::File::SDF>

=item L<Chemistry::File::SMILES>
    
=back

=item L<Chemistry::InternalCoords>

=item L<Chemistry::Mok>

=back

=head2 Procedural modules

These are auxiliary modules for which object classes seemed overkill

=over

=item L<Chemistry::Bond::Find>

=item Chemistry::Ring::Find (coming soon)

=back

=head2 Programs (scripts)

=over

=item mok

=back

=head1 VERSION INFORMATION

This is the PerlMol bundled release version 0.2300. It includes the following
distributions:

    Test-Simple                 0.47
    Scalar-List-Utils           1.14
    Storable                    2.12
    Text-Balanced               1.95
    Math-VectorReal             1.02
    Chemistry-Mol               0.23
    Chemistry-MacroMol          0.05
    Chemistry-InternalCoords    0.11
    Chemistry-File-MDLMol       0.15
    Chemistry-File-SMILES       0.33
    Chemistry-File-PDB          0.10
    Chemistry-File-Mopac        0.10
    Chemistry-Pattern           0.20
    Chemistry-Bond-Find         0.20
    Chemistry-Mok               0.20

The version number of a PerlMol bundle is always the same as the version number
of the included Chemistry-Mol distribution, plus two extra digits that
distinguish between different bundles based on the same Chemistry-Mol
distribution. Test-Simple, Scalar-List-Utils, Storable, and Text-Balanced
are already included with perl distributions since version 5.7.3, but they
are included here to simplify installation on perl 5.6.x distributions.

=head1 SEE ALSO

The PerlMol website L<http://www.perlmol.org/>

=head1 AUTHOR

Ivan Tubert E<lt>itub@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (c) 2004 Ivan Tubert. All rights reserved. This program is free
software; you can redistribute it and/or modify it under the same terms as
Perl itself.

=cut

