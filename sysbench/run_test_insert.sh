port=4000
oltpSize=3125000
numThreads=128
maxTime=600
tableC=16
bash ./prepare_insert1.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}
now=$(date +"%T")
echo "Current time : $now"
bash ./run_insert1.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}
now=$(date +"%T")
echo "Current time : $now"
bash ./clean_insert1.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime} ${tableC}

