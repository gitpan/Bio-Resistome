package Bio::Resistome::Input::Exceptions;
# ABSTRACT: Exceptions for input data 



use Exception::Class (
    Bio::Resistome::Input::Exceptions::FileDoesntExist   => { description => 'Couldnt open the file' },
);  
use Moose;

__PACKAGE__->meta->make_immutable;

no Moose;
1;

__END__

=pod

=head1 NAME

Bio::Resistome::Input::Exceptions - Exceptions for input data 

=head1 VERSION

version 1.123560

=head1 SYNOPSIS

Exceptions for input data 

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
