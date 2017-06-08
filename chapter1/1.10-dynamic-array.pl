package ArrayList;

use strict;
use warnings;

use feature qw(say);

sub new {
    my $classname = shift;

    my %options;
    $options{capacity} = 10;
    $options{size} = 0;
    $options{elements} = [];

    return bless \%options, $classname;
}

sub capacity {
    my ($self, $new_capacity) = @_;

    if ($new_capacity) {
	$self->{capacity} = $new_capacity;
    }

    return $self->{capacity};
}

sub size {
    my ($self, $new_size) = @_;

    if ($new_size) {
	$self->{size} = $new_size;
    }

    return $self->{size};
}

sub elements {
    my ($self, $new_elements) = @_;

    if ($new_elements) {
	$self->{elements} = $new_elements;
    }

    return $self->{elements};
}

sub add {
    my ($self, $elem) = @_;

    if ($self->size == $self->capacity) {
	my $new_capacity = $self->capacity * 2;
	my @new_array;
	$#new_array = $new_capacity;

	unshift @new_array, @{ $self->elements };
	$self->elements(\@new_array);
	$self->capacity($new_capacity);
    }

    $self->elements->[$self->size] = $elem;
    $self->size($self->size + 1);

    return 1;
}

1;

package main;

use strict;
use warnings;

use feature qw(say);

my $a = ArrayList->new;
foreach ( 0 .. 21 ) {
    $a->add($_);
}

say "SIZE: ", $a->size;
say "CAPACITY: ", $a->capacity;
use Data::Dumper;
print Dumper $a->elements;
say "ELEMENTS: ", join ', ', grep { defined $_ } @{ $a->elements };
