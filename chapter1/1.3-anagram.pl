#!perl

use strict;
use warnings;

use feature qw(say);

# Use single array to count character occurrences across both words
# Add for first pass
# Subtract for second pass
# Anagrams should have an array of all 0s at the end
# time: O(max(|N|,|M|))
# space: O(1)
sub anagram {
    my ($word1, $word2) = @_;
    return 0 unless length($word1) == length($word2);

    my @seen = (0) x 256;
    foreach my $c (split //, $word1) {
	$seen[ord $c]++;
    }

    foreach my $c (split //, $word2) {
	return 0 if --$seen[ord $c] < 0;
    }

    return 1;
}

say anagram('cat', 'tac');
say anagram('deposit', 'dopiest');
say anagram('cats', 'dogs');
