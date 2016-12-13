#!/bin/bash
export MYSQL_HOST=127.0.0.1
port=30040
# test select
echo "select 16*1000000 64"
./prepare_read_only.sh ${port} "" 1000000 64 1200 16 && ./run_read_only.sh ${port} "" 1000000 64 1200 16 && ./reset1.sh
echo "select 16*1000000 128"
./prepare_read_only.sh ${port} "" 1000000 128 1200 16 && ./run_read_only.sh ${port} "" 1000000 128 1200 16 && ./reset1.sh
echo "select 16*1000000 256"
./prepare_read_only.sh ${port} "" 1000000 256 1200 16 && ./run_read_only.sh ${port} "" 1000000 256 1200 16 && ./reset1.sh
echo "select 64*1000000 64"
./prepare_read_only.sh ${port} "" 1000000 64 1200 64 && ./run_read_only.sh ${port} "" 1000000 64 1200 64 && ./reset1.sh
echo "select 64*1000000 128"
./prepare_read_only.sh ${port} "" 1000000 128 1200 64 && ./run_read_only.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "select 64*1000000 256"
./prepare_read_only.sh ${port} "" 1000000 256 1200 64 && ./run_read_only.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh

# test insert
echo "insert 16*1000000 64"
./prepare_insert.sh ${port} "" 1000000 64 1200 16 && ./run_insert.sh ${port} "" 1000000 64 1200 16 && ./reset1.sh
echo "insert 16*1000000 128"
./prepare_insert.sh ${port} "" 1000000 128 1200 16 && ./run_insert.sh ${port} "" 1000000 128 1200 16 && ./reset1.sh
echo "insert 16*1000000 256"
./prepare_insert.sh ${port} "" 1000000 256 1200 16 && ./run_insert.sh ${port} "" 1000000 256 1200 16 && ./reset1.sh
echo "insert 64*1000000 64"
./prepare_insert.sh ${port} "" 1000000 64 1200 64 && ./run_insert.sh ${port} "" 1000000 64 1200 64 && ./reset1.sh
echo "insert 64*1000000 128"
./prepare_insert.sh ${port} "" 1000000 128 1200 64 && ./run_insert.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "insert 64*1000000 256"
./prepare_insert.sh ${port} "" 1000000 256 1200 64 && ./run_insert.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh

# test read_write
echo "read_write 16*1000000 64"
./prepare_read_write.sh ${port} "" 1000000 64 1200 16 && ./run_read_write.sh ${port} "" 1000000 64 1200 16 && ./reset1.sh
echo "read_write 16*1000000 128"
./prepare_read_write.sh ${port} "" 1000000 128 1200 16 && ./run_read_write.sh ${port} "" 1000000 128 1200 16 && ./reset1.sh
echo "read_write 16*1000000 256"
./prepare_read_write.sh ${port} "" 1000000 256 1200 16 && ./run_read_write.sh ${port} "" 1000000 256 1200 16 && ./reset1.sh
echo "read_write 64*1000000 64"
./prepare_read_write.sh ${port} "" 1000000 64 1200 64 && ./run_read_write.sh ${port} "" 1000000 64 1200 64 && ./reset1.sh
echo "read_write 64*1000000 128"
./prepare_read_write.sh ${port} "" 1000000 128 1200 64 && ./run_read_write.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "read_write 64*1000000 256"
./prepare_read_write.sh ${port} "" 1000000 256 1200 64 && ./run_read_write.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh

# test update
echo "update 16*1000000 64"
./prepare_update.sh ${port} "" 1000000 64 1200 16 && ./run_update.sh ${port} "" 1000000 64 1200 16 && ./reset1.sh
echo "update 16*1000000 128"
./prepare_update.sh ${port} "" 1000000 128 1200 16 && ./run_update.sh ${port} "" 1000000 128 1200 16 && ./reset1.sh
echo "update 16*1000000 256"
./prepare_update.sh ${port} "" 1000000 256 1200 16 && ./run_update.sh ${port} "" 1000000 256 1200 16 && ./reset1.sh
echo "update 64*1000000 64"
./prepare_update.sh ${port} "" 1000000 64 1200 64 && ./run_update.sh ${port} "" 1000000 64 1200 64 && ./reset1.sh
echo "update 64*1000000 128"
./prepare_update.sh ${port} "" 1000000 128 1200 64 && ./run_update.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "update 64*1000000 256"
./prepare_update.sh ${port} "" 1000000 256 1200 64 && ./run_update.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh
