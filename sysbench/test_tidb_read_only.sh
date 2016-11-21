#!/bin/bash
if [ $# != 4 ]; then
    echo "Usage: $0 oltp-count-size num-threads max-time table-count"
    exit 1
fi
port=4000
oltpSize=$1
numThreads=$2
maxTime=$3
tableC=$4
bash ./prepare_read_only.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./run_read_only.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_only.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}
