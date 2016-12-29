#!/usr/bin/perl -w
use strict;
use warnings;
#
# Execute all random queries, except 18.sql
#

my $output = "results/query-time.data";
my ($passwd, $port) = ($ARGV[1], $ARGV[0]);
my @sqls = ("1.sql", "2.sql", "3.sql", "4.sql", "5.sql", "6.sql", "7.sql");

foreach my $sql (@sqls) {
    print "query $sql\n";
    # system("./restart-mysql.pl");
    system("echo query: $sql >> $output");
    if( !defined($passwd) ) {
        system("./get-query-time.pl spcqueries/$sql test $port >> $output");
    }else {
        system("./get-query-time.pl spcqueries/$sql test $port $passwd >> $output");
    }
}
