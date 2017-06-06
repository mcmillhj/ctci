#!perl

use strict;
use warnings;

use feature qw(say);

sub compress {
    my ($string) = @_;
    # cannot compress empty string
    return '' unless $string;
    # length of 3 is the smallest string that could benefit from compression
    return $string unless length($string) > 2;

    my ($head, @tail) = split //, $string;
    my $count = 1;
    my @compressed;
    foreach my $c (@tail) {
	++$count and next if $head eq $c;

	push @compressed, _compress($head, $count);
	$head = $c;
	$count = 1;
    }

    # capture final substring
    push @compressed, _compress($head, $count);

    return join '', @compressed;
}

sub _compress {
    my ($s, $c) = @_;

    return $c <= 2 ? ($s x $c) : "${s}${c}";
}

say compress("aabcccccaaa");
