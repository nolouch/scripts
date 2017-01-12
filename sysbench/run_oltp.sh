#!/bin/bash
port=4000
passwd=""
oltpSize=1000000
numThreads=256
maxTime=0
tableC=16
database=sysbench
testLua="./db/oltp.lua"
MYSQL_HOST="127.0.0.1"
sysbench --test=${testLua}  \
         --mysql-host=$MYSQL_HOST --mysql-port=${port} --mysql-user=root --mysql-password=${passwd} \
         --mysql-db=${database} --oltp-tables-count=${tableC} --mysql-table-engine=innodb --oltp-table-size=${oltpSize} \
         --report-interval=60 --max-requests=1000000000 \
         --oltp-read-only=off  --oltp-test-mode=nontrx --num-threads=${numThreads} \
         --max-time=${maxTime} \
         run


