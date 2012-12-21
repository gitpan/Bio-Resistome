package Bio::Resistome::EMBL::Exceptions;
# ABSTRACT: Exceptions for EMBL


use Exception::Class (
    Bio::Resistome::EMBL::Exceptions::AccessionLookupFailed   => { description => 'Couldnt lookup the accession number metadata' },
    Bio::Resistome::EMBL::Exceptions::MoreThanOneDescription   => { description => 'Theres more than 1 description for an entry, shouldnt happen' },
);  
use Moose;

__PACKAGE__->meta->make_immutable;

no Moose;
1;

__END__

=pod

=head1 NAME

Bio::Resistome::EMBL::Exceptions - Exceptions for EMBL

=head1 VERSION

version 1.123560

=head1 SYNOPSIS

Exceptions for EMBL

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
