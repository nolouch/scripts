#!/bin/bash
export MYSQL_HOST=127.0.0.1
port=4000
database="test"
table_size=1000000
max_time=1200

# select test
echo "select 32*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  32
./run_select.sh ${port} "" ${table_size} 128 ${max_time} 32 ${database}
sleep 60
echo "select 32*${table_size} 256"
./run_select.sh ${port} "" ${table_size} 256 ${max_time} 32 ${database}
sleep 60
echo "select 32*${table_size} 512"
./run_select.sh ${port} "" ${table_size} 512 ${max_time} 32 ${database}
./reset_tidb.sh.sh
echo "select 64*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  64
./run_select.sh ${port} "" ${table_size} 128 ${max_time} 64 ${database}
sleep 60
echo "select 64*${table_size} 256"
./run_select.sh ${port} "" ${table_size} 256 ${max_time} 64 ${database}
sleep 60
echo "select 64*${table_size} 512"
./run_select.sh ${port} "" ${table_size} 512 ${max_time} 64 ${database}
./reset_tidb.sh

# insert test
echo "insert 32*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_insert.sh ${port} "" ${table_size} 128 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "insert 32*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_insert.sh ${port} "" ${table_size} 256 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "insert 32*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_insert.sh ${port} "" ${table_size} 512 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "insert 64*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_insert.sh ${port} "" ${table_size} 128 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "insert 64*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_insert.sh ${port} "" ${table_size} 256 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "insert 64*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_insert.sh ${port} "" ${table_size} 512 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60

# oltp test
echo "oltp 32*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_oltp.sh ${port} "" ${table_size} 128 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "oltp 32*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_oltp.sh ${port} "" ${table_size} 256 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "oltp 32*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_oltp.sh ${port} "" ${table_size} 512 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "oltp 64*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_oltp.sh ${port} "" ${table_size} 128 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "oltp 64*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_oltp.sh ${port} "" ${table_size} 256 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "oltp 64*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_oltp.sh ${port} "" ${table_size} 512 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60

# update test
echo "update 32*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_update.sh ${port} "" ${table_size} 128 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "update 32*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_update.sh ${port} "" ${table_size} 256 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "update 32*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  32 && ./run_update.sh ${port} "" ${table_size} 512 ${max_time} 32 ${database} && ./reset_tidb.sh
sleep 60
echo "update 64*${table_size} 128"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_update.sh ${port} "" ${table_size} 128 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "update 64*${table_size} 256"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_update.sh ${port} "" ${table_size} 256 ${max_time} 64 ${database} && ./reset_tidb.sh
sleep 60
echo "update 64*${table_size} 512"
./prepare.sh ${port} ${database} ${table_size}  64 && ./run_update.sh ${port} "" ${table_size} 512 ${max_time} 64 ${database} && ./reset_tidb.sh
