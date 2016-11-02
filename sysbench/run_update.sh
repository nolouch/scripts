if [ $# != 5 ]; then
    echo "Usage: $0 port paswd oltp-count-size num-threads max-time"
    exit 1
fi
port=$1
passwd=$2
oltpSize=$3
numThreads=$4
maxTime=$5
testLua="./db/update_index.lua"
if [ $port == "4000" ]; then
    testLua="./db/update_index_.lua"
fi
sysbench --test=${testLua}  \
         --mysql-host=127.0.0.1 --mysql-port=${port} --mysql-user=root --mysql-password=${passwd} \
         --mysql-db=test --oltp-tables-count=1 --mysql-table-engine=innodb --oltp-table-size=${oltpSize} \
         --report-interval=60 --max-requests=1000000000 \
         --oltp-read-only=off  --oltp-test-mode=nontrx --num-threads=${numThreads} \
         --max-time=${maxTime} \
         run


