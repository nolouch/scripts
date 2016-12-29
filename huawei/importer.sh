#!/bin/bash
if  [ $# != 2 ];  then
    echo "Usage: $0 port count"
    exit 1
fi

port=$1
#passwd=$2
count=$2

./importer -t "create table t(a int, b double, c varchar(10),d varchar(10), d1 varchar(10), d2 varchar(10), d3 varchar(10), d4 varchar(10), d5 varchar(10), d6 varchar(10));"  \
       -h  127.0.0.1  -P ${port} -D test   \
       -n ${count}  \
       -c 100 -b 100
