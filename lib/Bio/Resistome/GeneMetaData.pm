package Bio::Resistome::GeneMetaData;

# ABSTRACT: Datastructure to represent the meta data for a gene


use Moose;

has 'accession_number' => (is => 'ro', isa => 'Str', required => 1);
has 'species'          => (is => 'ro', isa => 'Maybe[Str]');
has 'taxon_id'         => (is => 'ro', isa => 'Maybe[Int]');
has 'lineage'          => (is => 'ro', isa => 'ArrayRef');
has 'pubmed_ids'       => (is => 'ro', isa => 'ArrayRef');
has 'description'      => (is => 'ro', isa => 'Maybe[Str]');

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=head1 NAME

Bio::Resistome::GeneMetaData - Datastructure to represent the meta data for a gene

=head1 VERSION

version 1.123560

=head1 SYNOPSIS

Take in a reference genome and evolve it.

    use BBio::Resistome::GeneMetaData;
    my $obj = Bio::Resistome::GeneMetaData->new(
       species => 'aaa',
       taxon_id => 123,
       lineage => ['abc','efg','hij']
    );

=head1 SEE ALSO

=over 4

=item *

L<Bio::Resistome::EMBL::AccessionLookup>

=back

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
