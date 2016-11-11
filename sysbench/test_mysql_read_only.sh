#!/bin/bash
port=3306
passwd=000000
oltpSize=1000000
numThreads=100
maxTime=600
tableC=1
bash ./prepare_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./run_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}


