#!/bin/bash
if  [ $# != 3 ];  then
    echo "Usage: $0 port start end"
    exit 1
fi

port=$1
startT=$2
endT=$3

for ((i = ${startT}; i <= ${endT}; i++))
do
mysql -h 127.0.0.1 -P ${port} -u root -D test  << EOF
INSERT INTO t(a, b, c) VALUES($i, $i, "pingcap");
EOF
done
