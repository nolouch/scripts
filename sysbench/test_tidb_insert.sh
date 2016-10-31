if [ $# != 3 ]; then
    echo "Usage: $0 oltp-count-size num-threads max-time"
    exit 1
fi
port=4000
oltpSize=$1
numThreads=$2
maxTime=$3
bash ./prepare_insert.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime}
bash ./run_insert.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime}
bash ./clean_insert.sh ${port} "" ${oltpSize} ${numThreads} ${maxTime}
