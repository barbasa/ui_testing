#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use YAML;
use DBI;

my $dbh = DBI->connect(
    "DBI:mysql:database=adzuna_core;host=33.33.33.10",
    "root", "rootpass"
) or die $DBI::err;

open(my $fh, "<", "$FindBin::Bin/../../public/Configuration/common/message/category_localisation.conf") or die $!;

my %category;

my $sth = $dbh->prepare(
    "SELECT * FROM Category where tag_uk = ? LIMIT 1"
);

while (my $line = <$fh>) {
# LABEL::engineering-jobs:br                        Vagas em Engenharia
    if ($line =~ /^LABEL::(.+):(\w\w)\s+(.+)$/) {
        my $label   = $1;
        my $country = $2;
        my $text    = $3;

        $sth->execute($label);
        my $data = $sth->fetchrow_hashref();
        $sth->finish;


        $category{$data->{"tag_$country"}} = $3;
    }
}

print YAML::Dump({ category => \%category });
