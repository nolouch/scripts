#!/bin/bash
port=3306
passwd=000000
maxTime=600
oltpSize=1000000
numThreads=100
tableC=1
bash ./prepare_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "100w read only"
bash ./run_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
sleep 20
echo "100w update"
bash ./run_update.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

bash ./prepare_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "100w insert"
bash ./run_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

bash ./prepare_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "100w read write"
bash ./run_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}


oltpSize=10000000
numThreads=100
tableC=1
bash ./prepare_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "1000w read only"
bash ./run_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
sleep 20
echo "1000w update"
bash ./run_update.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

bash ./prepare_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "1000w insert"
bash ./run_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

bash ./prepare_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "1000w read write"
bash ./run_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

oltpSize=2500000
numThreads=100
tableC=20
bash ./prepare_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "1000w read only"
bash ./run_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
sleep 20
echo "1000w update"
bash ./run_update.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

sleep 20
echo "1000w read write"
bash ./run_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

sleep 20
echo "1000w insert"
bash ./run_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

oltpSize=2500000
numThreads=100
tableC=40
bash ./prepare_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
echo "10000w read only"
bash ./run_read_only.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
sleep 20
echo "10000w update"
bash ./run_update.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

sleep 20
echo "10000w read write"
bash ./run_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

sleep 20
echo "10000w insert"
bash ./run_insert.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}
bash ./clean_read_write.sh ${port} ${passwd} ${oltpSize} ${numThreads} ${maxTime} ${tableC}

