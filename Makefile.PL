
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Queue memcache calls when in a dbh transaction",
  "AUTHOR" => "Jason Terry <oaxlin\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MemcacheDBI",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MemcacheDBI",
  "PREREQ_PM" => {
    "Cache::Memcache::Fast" => 0,
    "DBI" => 0
  },
  "TEST_REQUIRES" => {
    "DBI::CSV" => 0,
    "Data::Dumper" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Cache::Memcache::Fast" => 0,
  "DBI" => 0,
  "DBI::CSV" => 0,
  "Data::Dumper" => 0,
  "Test::Deep" => 0,
  "Test::More" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


