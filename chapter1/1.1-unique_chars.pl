#!perl

use strict;
use warnings;

use feature qw(say);

# time: O(|N|)
# space: O(1)
sub uniq {
    my ($alphabet_size) = @_;

    return sub {
	my ($string) = @_;
	return 0 if length($string) > $alphabet_size;

	my @seen_char = (0) x 256;
	foreach my $char (split //, $string) {
	    if ($seen_char[ord $char]++) {
		return 0;
	    }
	}

	return 1;
    };
}

# time: O(|N|)
# space: O(1) -- reduced by factor of 8
sub uniq_bit {
    my ($string) = @_;

    my $seen = 0;
    foreach my $char (split //, $string) {
	my $bit_index = ord($char) - ord('a');
	return 0 if ($seen & (1 << $bit_index)) == 1;

	$seen |= (1 << $bit_index);
    }

    return 1;
}

binmode STDOUT, ":utf8";

my $ascii_uniq = uniq(256);
my $unicode_uniq = uniq(200_000);

say $ascii_uniq->('abc');
say $ascii_uniq->('AABC');
say $unicode_uniq->("\N{GREEK CAPITAL LETTER PHI}\N{GREEK CAPITAL LETTER GAMMA}\N{GREEK CAPITAL LETTER DELTA}");
say $ascii_uniq->(join '', map { chr } 0 .. 255);
say $ascii_uniq->(join '', map { chr } 0 .. 255, 0..5);

say 'Bit Vector: ';
say uniq_bit('abc');
say uniq_bit('aabc');
