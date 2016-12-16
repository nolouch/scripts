#!/bin/bash
export SYSBENCH=./sysbench
export IMPORTER=./importer
script=$(readlink -f $0)
work_path=`dirname $script`
host=127.0.0.1
port=4000
database="test"
table_size=1000000
max_time=1800
result_file=result.out

cd ${work_path}
test_lua=("./db/select.lua" "./db/insert.lua" "./db/oltp.lua" "./db/update_index.lua")
table_num=(32 64)
thread_num=(128 256 512)
cat /dev/null >  ${result_file}
for file in ${test_lua[@]}; do
    for table_count in ${table_num[@]}; do
        for thread_count in ${thread_num[@]}; do
            echo -e "\n\n################## ${file} ${table_count}*${table_size} threads: ${thread_count} ###################\n"
            echo "prepare data......"
            ./prepare.sh ${host} ${port} ${database} ${table_size} ${table_count}
            echo "running sysbench test......"
            ./common.sh ${host} ${port} "" ${database} ${table_count} ${table_size} ${thread_count} ${max_time} ${file} >> ${result_file}
            echo "clean data......"
            ./reset_tidb.sh
            sleep 10
        done
    done
done

