#!perl

use strict;
use warnings;

use feature qw(say);

use Data::Dumper;

my @matrix = (
    [qw(1 2 3 4)],
    [qw(5 6 7 8)],
    [qw(0 10 11 12)],
    [qw(13 14 15 16)],
);


sub zero {
    my ($matrix) = @_;

    my @rows = (0) x @$matrix;
    my @cols = (0) x @$matrix;

    foreach my $row (0 .. $#{ $matrix }) {
	foreach my $col (0 .. $#{ $matrix[$row] }) {
	    next unless $matrix[$row][$col] == 0;

	    $rows[$row] = 1;
	    $cols[$col] = 1;
	}
    }

    print Dumper \@cols;
    print Dumper \@rows;

    # zero rows
    foreach my $row (0 .. $#{ $matrix }) {
	next unless $rows[$row] == 1;

	foreach my $col (0 .. $#{ $matrix[$row] }) {
	    $matrix[$row][$col] = 0;
	}
    }

    # zero cols
    foreach my $col (0 .. $#{ $matrix }) {
	next unless $cols[$col] == 1;

	foreach my $row (0 .. $#{ $matrix[$col] }) {
	    $matrix[$row][$col] = 0;
	}
    }
}

print Dumper \@matrix;
zero(\@matrix);
print Dumper \@matrix;
