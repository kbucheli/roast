use v6-alpha;
use Test;

# Tests for auto-increment and auto-decrement operators
# originally from Perl 5, by way of t/operators/auto.t

plan 45;

#L<S03/Autoincrement precedence>

my $base = 10000;

my $x = 10000;
is(0 + ++$x - 1, $base);
is(0 + $x-- - 1, $base);
is(1 * $x,       $base);
is(0 + $x-- - 0, $base);
is(1 + $x,       $base);
is(1 + $x++,     $base);
is(0 + $x,       $base);
is(0 + --$x + 1, $base);
is(0 + ++$x + 0, $base);
is($x,           $base);

my @x;
@x[0] = 10000;
is(0 + ++@x[0] - 1, $base);
is(0 + @x[0]-- - 1, $base);
is(1 * @x[0],       $base);
is(0 + @x[0]-- - 0, $base);
is(1 + @x[0],       $base);
is(1 + @x[0]++,     $base);
is(0 + @x[0],       $base);
is(0 + ++@x[0] - 1, $base);
is(0 + --@x[0] + 0, $base);
is(@x[0],           $base);

my %z;
%z{0} = 10000;
is(0 + ++%z{0} - 1, $base);
is(0 + %z{0}-- - 1, $base);
is(1 * %z{0},       $base);
is(0 + %z{0}-- - 0, $base);
is(1 + %z{0},       $base);
is(1 + %z{0}++,     $base);
is(0 + %z{0},       $base);
is(0 + ++%z{0} - 1, $base);
is(0 + --%z{0} + 0, $base);
is(%z{0},           $base);

# Increment of a Str
#L<S03/Autoincrement precedence/Increment of a>

# XXX: these need to be re-examined and extended per changes to S03.
# Also, see the thread at
# http://www.nntp.perl.org/group/perl.perl6.compiler/2007/06/msg1598.html
# which prompted many of the changes to Str autoincrement/autodecrement.

my $foo;

$foo = '99';
is(++$foo, '100');

$foo = 'a0';
is(++$foo, 'a1');

$foo = 'Az';
is(++$foo, 'Ba');

$foo = 'zz';
is(++$foo, 'aaa');

$foo = 'A99';
is(++$foo, 'B00');

# EBCDIC guards: i and j, r and s, are not contiguous.
$foo = 'zi';
is(++$foo, 'zj');

$foo = 'zr';
is(++$foo, 'zs');

# test magical autodecrement
$foo = '100';
is(--$foo, '099');

$foo = 'a1';
is(--$foo, 'a0'); 

$foo = 'Ba';
is(--$foo, 'Az');

$foo = 'aaa';
is(--$foo, 'aaa');

$foo = 'B00';
is(--$foo, 'A99');

$foo = 'A00';
is(--$foo, 'A00');



my$file = "/tmp/pix000.jpg";
$file++;            # /tmp/pix001.jpg, not /tmp/pix000.jph
is($file,'/tmp/pix001.jpg');

my $num = "123.456";
$num++;             # 124.456, not 123.457

is($num,'124.456');
