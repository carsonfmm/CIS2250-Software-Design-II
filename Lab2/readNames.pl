#!/usr/bin/env perl

#
# readNames.pl
#   Author(s): Carson Mifsud (), Hamna Akram ()
#   Earlier contributors(s): Andrew Hamilton-Wright, Deborah Stacey
#
#   Project: Lab Assignment 1 Task 1 Script
#   Date of Last Update: Jan 17 2020.
#
#   Functional Summary
#       readNames.pl takes in a CSV (comma separated version) file
#       and prints out the fields.
#
#       There are expected to be three fields:
#           1. name
#           2. sex (only F or M recorded in this US census data)
#           3. number of people with this name
#
#       This code will also count the number of names in each of the
#       "F" and "M" categories, and print this out at the end.
#
#       The file represents the names of people in the population
#       for a particular year of birth in the United States of America.
#       Officially it is the "National Data on the relative frequency
#       of given names in the population of U.S. births where the individual
#       has a Social Security Number".
#
#      Commandline Parameters: 1
#         $ARGV[0] = name of the input file containing the names
#
#      References
#         Name files from http://www.ssa.gov/OACT/babynames/limits.html
#


#
#   Packages and modules
#
use strict;
use warnings;

# This will ensure that the version of Perl to be used is at least this new
use version;   our $VERSION = qv('5.16.0');

# Here we must *forward declare* our modules, meaning that if we want
# to use them below, we need to tell perl that here.
#
# We will be using the CSV module (version 1.32 or higher) to parse each line
use Text::CSV  1.32;
# We will be using the BOM module (version 0.16 or higher) to get rid of
# and Byte Order Marks that we have in our input files
use File::BOM  0.16;


#
#   Variables to be used
#

# These two variables are a quoted space, and a quoted comma.  Sometimes
# you will see these constructed through the 'q' operator, and sometimes
# with quoted strings.  The value q{,} is the same as ",", and q{} is
# the empty string "".  You will see that Perl::Critic will recommend
# these values, referring to page 53 of PBP, as this is more visible
# than the simple quoting, and therefore more legible.
my $SPACE = q{ };
my $COMMA = q{,};
my $EMPTY = q{};

# variables used in computations below
my $namedata_filename = $EMPTY;
my @lines;
my $record_count = 0;
my $female_count = 0;
my $male_count   = 0;
my $total_count  = 0;
my $sex_count    = 0;
my @given_name;
my @sex;
my @number;

# set up our CSV (Comma Separated Value) parser
my $csv          = Text::CSV->new({ sep_char => $COMMA });


#
#   Check that we have been given the right number of parameters,
#   and store the single command line argument in a variable with
#   a better name
#
if ($#ARGV != 0 ) {
    print "Usage: readNames.pl <names file>\n" or die "Print failure\n";
    exit;
} else {
    $namedata_filename = $ARGV[0];
}


#
# Open the input file and load the contents into an array, where
# each array location holds one line from the file
#
open my $names_fh, '<:via(File::BOM)', $namedata_filename
        or die "Unable to open names file: '$namedata_filename'\n";

@lines = <$names_fh>;

close $names_fh or
        die "Unable to close: $ARGV[0]\n";   # Close the input file


#
#   Parse each line of data from the array holding the file contents,
#   and break the line into fields based on the comma delimiter, where
#   the fields are stored in a different array for only this line of
#   data.
#
foreach my $name_record ( @lines ) {

    # uncomment this to see the raw line of the file
    #print $name_record;

    if ( $csv->parse($name_record) ) {
        my @master_fields = $csv->fields();

        # uncomment this to see the full list of all of the parsed fields
        #print @master_fields;

        $given_name[$record_count] = $master_fields[0];
        $sex[$record_count]        = $master_fields[1];
        $number[$record_count]     = $master_fields[2];
        $record_count++;
    } else {
        warn "Line/record could not be parsed: $name_record\n";
    }
}


#
#   Print out the lines and counts
#

for my $i ( 0..($record_count-1) ) {
    if ($sex[$i] eq 'F') {
       $sex_count++;
    }
}

for my $i ( 0..(4) ) {
    print $given_name[$i].$SPACE.'('.$number[$i].')'."\n" or
            die "Print failure\n";

    $female_count = $female_count + $number[$i];
}

print 'Total number of females: '.$female_count."\n" or
        die "Print failure\n";

for my $sex_count ( $sex_count..($sex_count+4) ) {
    print $given_name[$sex_count].$SPACE.'('.$number[$sex_count].')'."\n" or
            die "Print failure\n";

    $male_count = $male_count + $number[$sex_count];
}

print 'Total number of males: '.$male_count."\n" or
        die "Print failure\n";

$total_count = $female_count + $male_count;

print 'Total number: '.$total_count."\n" or
        die "Print failure\n";


#
#   End of Script
#
