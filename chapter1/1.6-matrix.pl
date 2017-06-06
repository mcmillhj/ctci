#!perl

use strict;
use warnings;

use feature qw(say);

use Data::Dumper;

my @matrix = (
    [qw(1 2 3 4)],
    [qw(5 6 7 8)],
    [qw(9 10 11 12)],
    [qw(13 14 15 16)],
);

# my @matrix = (
    # [qw(1 2)],
    # [qw(3 4)],
# );

sub rotate {
    my ($matrix, $n) = @_;

    for(my $layer = 0; $layer < $n / 2; $layer++) {
	my $first = $layer;
	my $last = $n - 1 - $layer;
	for(my $i = $first; $i < $last; $i++) {
	    my $offset = $i - $first;

	    my $temp = $matrix[$first][$i];
	    $matrix[$first][$i] = $matrix[$last-$offset][$first];
	    $matrix[$last-$offset][$first] = $matrix[$last][$last-$offset];
	    $matrix[$last][$last-$offset] = $matrix[$i][$last];
	    $matrix[$i][$last] = $temp;
	}
    }
}

sub reverse_rows {
    my ($matrix) = @_;

    my $len = @{ $matrix };
    foreach my $row (0 .. $#{ $matrix }) {
	foreach my $col (0 .. int($len / 2)) {
	    my $temp = $matrix[$row][$col];
	    $matrix[$row][$col] = $matrix[$row][$len - $col - 1];
	    $matrix[$row][$len - $col - 1] = $temp;
	}
    }
}

sub reverse_cols {
    my ($matrix) = @_;

    my $len = @{ $matrix };
    foreach my $col (0 .. $#{ $matrix }) {
	foreach my $row (0 .. int($len / 2)) {
	    my $temp = $matrix[$row][$col];
	    $matrix[$row][$col] = $matrix[$len - $row - 1][$col];
	    $matrix[$len - $row - 1][$col] = $temp;
	}
    }
}

sub transpose {
    my ($matrix) = @_;

    foreach my $row (0 .. $#{ $matrix }) {
	foreach my $col (0 .. $#{ $matrix[$row] }) {
	    $matrix[$row][$col] = $matrix[$col][$row];
	}
    }
}

my $rotate_right = sub {
    my ($matrix) = @_;

    transpose($matrix);
    reverse_rows($matrix);
};


print Dumper \@matrix;
say '';
$rotate_right->(\@matrix);
print Dumper \@matrix;
