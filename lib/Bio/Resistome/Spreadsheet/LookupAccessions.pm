package Bio::Resistome::Spreadsheet::LookupAccessions;
# ABSTRACT: Create a spreadsheet containing accession lookup results.



use Moose;
use Bio::Resistome::Spreadsheet::File;
use Bio::Resistome::Spreadsheet::LookupRow;

has 'genes_metadata'    => ( is => 'ro', isa => 'ArrayRef', required => 1 ); 
has 'output_file_name'  => ( is => 'ro', isa => 'Str',      default => 'output.csv' ); 

sub create
{
  my($self) = @_; 
  
  my @spreadsheet_rows;
  my @spreadsheet_header;
  for my $gene_metadata(@{$self->genes_metadata})
  {
    my $spreadsheet_row_obj = Bio::Resistome::Spreadsheet::LookupRow->new(gene_metadata => $gene_metadata);
    push(@spreadsheet_rows, @{$spreadsheet_row_obj->formatted_row});
    
    if((! @spreadsheet_header ) || @spreadsheet_header < 1)
    {
      @spreadsheet_header = @{$spreadsheet_row_obj->formatted_header};
    }
  }
  
  my $spreadsheet = Bio::Resistome::Spreadsheet::File->new(
    spreadsheet_rows => \@spreadsheet_rows,
    header           => \@spreadsheet_header,
    output_file_name => $self->output_file_name
  );
  $spreadsheet->create();
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=head1 NAME

Bio::Resistome::Spreadsheet::LookupAccessions - Create a spreadsheet containing accession lookup results.

=head1 VERSION

version 1.123560

=head1 SYNOPSIS

Create a row representation of the accession lookup results.

   use Bio::Resistome::Spreadsheet::LookupAccessions;
   my $spreadsheet_row_obj = Bio::Resistome::Spreadsheet::LookupAccessions->new(
     genes_metadata => $gene_meta_data_obj,
     output_file_name => 'abc'
   );
   $spreadsheet_row_obj->create;

=head1 METHODS

=head2 create

Create a spreadsheet file of accession lookup results.

=head1 SEE ALSO

=over 4

=item *

L<Bio::Resistome::GeneMetaData>

=item *

L<Bio::Resistome::Spreadsheet::File>

=back

=head1 AUTHOR

Andrew J. Page <ap13@sanger.ac.uk>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Wellcome Trust Sanger Institute.

This is free software, licensed under:

  The GNU General Public License, Version 3, June 2007

=cut
