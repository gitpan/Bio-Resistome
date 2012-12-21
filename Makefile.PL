
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Antibiotic resistome gene database",
  "AUTHOR" => "Andrew J. Page <ap13\@sanger.ac.uk>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "Test::Most" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bio-Resistome",
  "EXE_FILES" => [
    "bin/lookup_accession_metadata"
  ],
  "LICENSE" => "gpl",
  "NAME" => "Bio::Resistome",
  "PREREQ_PM" => {
    "Exception::Class" => 0,
    "Getopt::Long" => 0,
    "LWP::UserAgent" => 0,
    "Moose" => 0,
    "Text::CSV" => 0,
    "URI::Escape" => 0,
    "XML::TreePP" => 0
  },
  "VERSION" => "1.123560",
  "test" => {
    "TESTS" => "t/Bio/Resistome/*.t t/Bio/Resistome/EMBL/*.t t/Bio/Resistome/Input/*.t t/Bio/Resistome/Spreadsheet/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



