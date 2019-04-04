#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use feature 'say';
use lib '/secure/Common/src/cpan';

use FindBin;
use lib "$FindBin::Bin/lib";
use Getopt::Long;
use Data::Dumper;
use LWP::UserAgent;
use JSON::XS;
use File::Slurp qw/read_file/;

binmode(STDOUT, ':encoding(utf8)');

my $ua = LWP::UserAgent->new;

my $data = read_file ('city.json');
my $json = decode_json ($data);


print 'return @[@"", @"★",';
for my $group (@$json)
{
    printf ("@\"%s\", ", $group->{title});
}
say '];';

say '';

print<<EOF
return @[ 
    @[
        [[CityModel alloc] initWithData:@"北京" pinyin:@"-" shortname:@"-"]
    ],
    @[
        [[CityModel alloc] initWithData:@"北京" pinyin:@"beijing" shortname:@"bj"],
        [[CityModel alloc] initWithData:@"上海" pinyin:@"shanghai" shortname:@"sh"],
        [[CityModel alloc] initWithData:@"深圳" pinyin:@"shenzhen" shortname:@"sz"],
        [[CityModel alloc] initWithData:@"广州" pinyin:@"guangzhou" shortname:@"gz"]
    ],
EOF
;

for my $group (@$json)
{
    say "\t@[";
    for my $e (@{ $group->{elements} })
    {
        my @s = @{ $e->{s} };
        printf ("\t\t[[CityModel alloc] initWithData:@\"%s\" pinyin:@\"%s\" shortname:@\"%s\"],\n", $e->{name}, $e->{en}, $s[scalar @s - 1]);
    }
    say "\t],";
}

say '];';
