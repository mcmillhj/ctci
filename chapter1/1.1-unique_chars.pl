#!perl

use strict;
use warnings;

use feature qw(say);

sub uniq {
    my ($alphabet_size) = @_;

    return sub {
	my ($string) = @_;
	return 0 if length($string) > $alphabet_size;

	my @seen_char;
	foreach my $char (split //, $string) {
	    if ($seen_char[ord $char]++) {
		return 0;
	    }
	}

	return 1;
    };
}

binmode STDOUT, ":utf8";

my $ascii_uniq = uniq(256);
my $unicode_uniq = uniq(200_000);

say $ascii_uniq->('abc');
say $ascii_uniq->('AABC');
say $unicode_uniq->("\N{GREEK CAPITAL LETTER PHI}\N{GREEK CAPITAL LETTER GAMMA}\N{GREEK CAPITAL LETTER DELTA}");
say $ascii_uniq->(join '', map { chr } 0 .. 255);
say $ascii_uniq->(join '', map { chr } 0 .. 255, 0..5);
