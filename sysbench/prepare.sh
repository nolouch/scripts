#!/bin/bash
ulimit -n 40960

MYSQL_HOST=127.0.0.1
PORT=4000
DATABASE=sysbench
SIZE=1000000
TABLES=16
TIDB_IMPORTER=${IMPORTER:-"./importer"}

for id in $(seq 1 $TABLES); do
    echo creating sbtest$id
    echo "create table if not exists sbtest$id(id INTEGER UNSIGNED primary key  NOT NULL AUTO_INCREMENT, k INTEGER , c varchar(120), pad CHAR(60));" | mysql -u root -P ${PORT} -h "$MYSQL_HOST" -D "${DATABASE}"
    echo "create index k_$id on sbtest$id(k);" | mysql -u root -P ${PORT} -h "${MYSQL_HOST}" -D "${DATABASE}"
done

for id in $(seq 1 $TABLES); do
    echo insert sbtest$id ...
    $TIDB_IMPORTER -u root -P ${PORT} -h "$MYSQL_HOST" -c 512 -n $SIZE -b 100 -D "${DATABASE}" \
        -t "create table if not exists sbtest$id(id INTEGER UNSIGNED primary key NOT NULL AUTO_INCREMENT comment '[[range=1,$SIZE]]', k INTEGER, c varchar(120), pad CHAR(60));"
done
