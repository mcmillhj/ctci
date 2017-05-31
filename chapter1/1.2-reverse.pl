#!perl

use strict;
use warnings;

use feature qw(say);

sub reverse_stdlib {
    return reverse @_;
}

sub reverse_inplace {
    my ($arr) = @_;

    for(my $i = 0; $i < int(@$arr / 2); $i++) {
	my $swap_index = @$arr - $i - 1;
	($arr->[$i], $arr->[$swap_index]) = ($arr->[$swap_index], $arr->[$i]);
    }
}

my @tests = (
    [qw(A B C D E F)],
    [qw(A B C D E F G)],
);

foreach my $test (@tests) {
    say "reverse(@$test) = ";
    reverse_inplace($test);
    say @$test;
}
