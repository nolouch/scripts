#!/bin/bash
if [ $# != 9 ]; then
    echo "Usage: $0 host port password database table-count oltp-count-size num-threads max-time test_lua"
    exit 1
fi
host=$1
port=$2
passwd=$3
database=$4
tableC=$5
oltpSize=$6
numThreads=$7
maxTime=$8
testLua=$9
sysbench=${SYSBENCH:-"./sysbench"}
echo -e "\n\n################## ${testLua} ${tableC}*${oltpSize} threads: ${numThreads} ################\n"
${sysbench} --test=${testLua}  \
         --mysql-host=${host} --mysql-port=${port} --mysql-user=root --mysql-password=${passwd} \
         --mysql-db=${database} --oltp-tables-count=${tableC} --mysql-table-engine=innodb --oltp-table-size=${oltpSize} \
         --report-interval=600 --max-requests=1000000000 \
         --oltp-read-only=off  --oltp-test-mode=nontrx --num-threads=${numThreads} \
         --max-time=${maxTime} \
             run

