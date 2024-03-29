package Bio::Resistome::Spreadsheet::LookupRow;
# ABSTRACT: Create a row representation of the accession lookup results



use Moose;

has 'gene_metadata'    => ( is => 'ro', isa => 'Bio::Resistome::GeneMetaData',     required => 1 ); 
has 'formatted_row'    => ( is => 'ro', isa => 'ArrayRef', lazy => 1, builder => '_build_formatted_row'); 
has 'formatted_header' => ( is => 'ro', isa => 'ArrayRef', lazy => 1, builder => '_build_formatted_header'); 

sub _comma_separate_array_into_a_single_string
{
  my ($self,$input_array) = @_;
  return join(',',@{$input_array});
}

sub _build_formatted_row
{
  my ($self) = @_;

  my @row_cells = [
    $self->gene_metadata->accession_number, 
    $self->gene_metadata->species, 
    $self->gene_metadata->taxon_id,
    $self->gene_metadata->description,
    $self->_comma_separate_array_into_a_single_string($self->gene_metadata->lineage),
    $self->_comma_separate_array_into_a_single_string($self->gene_metadata->pubmed_ids),
  ];

  return \@row_cells;
}

sub _build_formatted_header
{
  my ($self) = @_;
  return ['Accession number', 'Species','TaxonID','Description', 'Lineage','PubMed IDs'];
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=head1 NAME

Bio::Resistome::Spreadsheet::LookupRow - Create a row representation of the accession lookup results

=head1 VERSION

version 1.123560

=head1 SYNOPSIS

Create a row representation of the accession lookup results

   use Bio::Resistome::Spreadsheet::LookupRow;
   my $spreadsheet_row_obj = Bio::Resistome::Spreadsheet::LookupRow->new(
     gene_metadata => $gene_meta_data_obj
   );
   $spreadsheet_row_obj->formatted_row;

=head1 METHODS

=head2 formatted_row

Returns the spreadsheet row of results, as an array, suitable for outputting to a CSV file.

=head2 formatted_header

Returns the header columns, as an array, suitable for outputting to a CSV file.

=head1 SEE ALSO

=over 4

=item *

L<Bio::Resistome::GeneMetaData>

=back

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
