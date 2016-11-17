#!/bin/bash
if  [ $# != 1 ];  then
    echo "Usage: $0 port"
    exit 1
fi

port=$1

mysql -h 127.0.0.1 -P ${port} -u root -D test  << EOF
create table t(a int, b double, c varchar(10));
EOF
