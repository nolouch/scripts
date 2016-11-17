#!/bin/bash
if  [ $# != 1 ];  then
    echo "Usage: $0 port"
    exit 1
fi

port=$1

mysql -h 127.0.0.1 -P ${port} -u root -D test  << EOF
create index key_a on  t(a);
EOF
