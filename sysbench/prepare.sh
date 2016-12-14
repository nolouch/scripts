#!/bin/bash
ulimit -n 40960

PORT=$1
DATABASE=$2
SIZE=$3
TABLES=$4
TIDB_IMPORTER=$GOPATH/bin/importer
echo $TIDB_IMPORTER


for id in $(seq 1 $TABLES); do
    echo creating sbtest$id
    echo "create table if not exists sbtest$id(id INTEGER UNSIGNED primary key, k INTEGER , c varchar(120), pad CHAR(60));" | mysql -u root -P ${PORT} -h "$MYSQL_HOST" -D "${DATABASE}"
    echo "create index k_$id on sbtest$id(k);" | mysql -u root -P ${PORT} -h "${MYSQL_HOST}" -D "${DATABASE}"
done

echo now set tidb lease != 0
read

for id in $(seq 1 $TABLES); do
    echo insert sbtest$id ...
    $TIDB_IMPORTER -u root -P ${PORT} -h "$MYSQL_HOST" -c 1280 -n $SIZE -b 100 -D "${DATABASE}" \
        -t "create table if not exists sbtest$id(id INTEGER UNSIGNED unique primary key comment '[[step=1]]', k INTEGER, c varchar(120), pad CHAR(60));"
done
