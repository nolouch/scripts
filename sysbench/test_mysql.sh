#!/bin/bash
port=4000
passwd=000000
# test select
echo "select 16*1000000 64"
./prepare_read_only.sh ${port} ${passwd} 1000000 64 1200 16 && ./run_read_only.sh ${port} ${passwd} 1000000 64 1200 16 && ./clean_read_only.sh ${port} ${passwd} 1000000 64 1200 16
echo "select 16*1000000 128"
./prepare_read_only.sh ${port} ${passwd} 1000000 128 1200 16 && ./run_read_only.sh ${port} ${passwd} 1000000 128 1200 16 && ./clean_read_only.sh ${port} ${passwd} 1000000 128 1200 16
echo "select 16*1000000 256"
./prepare_read_only.sh ${port} ${passwd} 1000000 256 1200 16 && ./run_read_only.sh ${port} ${passwd} 1000000 256 1200 16 && ./clean_read_only.sh ${port} ${passwd} 1000000 256 1200 16
echo "select 64*1000000 64"
./prepare_read_only.sh ${port} ${passwd} 1000000 64 1200 64 && ./run_read_only.sh ${port} ${passwd} 1000000 64 1200 64 && ./clean_read_only.sh ${port} ${passwd} 1000000 64 1200 64
echo "select 64*1000000 128"
./prepare_read_only.sh ${port} ${passwd} 1000000 128 1200 64 && ./run_read_only.sh ${port} ${passwd} 1000000 128 1200 64 && ./clean_read_only.sh ${port} ${passwd} 1000000 128 1200 64
echo "select 64*1000000 256"
./prepare_read_only.sh ${port} ${passwd} 1000000 256 1200 64 && ./run_read_only.sh ${port} ${passwd} 1000000 256 1200 64 && ./clean_read_only.sh ${port} ${passwd} 1000000 256 1200 64

# test insert
echo "insert 16*1000000 64"
./prepare_insert.sh ${port} ${passwd} 1000000 64 1200 16 && ./run_insert.sh ${port} ${passwd} 1000000 64 1200 16 && ./clean_insert.sh ${port} ${passwd} 1000000 64 1200 16
echo "insert 16*1000000 128"
./prepare_insert.sh ${port} ${passwd} 1000000 128 1200 16 && ./run_insert.sh ${port} ${passwd} 1000000 128 1200 16 && ./clean_insert.sh ${port} ${passwd} 1000000 128 1200 16
echo "insert 16*1000000 256"
./prepare_insert.sh ${port} ${passwd} 1000000 256 1200 16 && ./run_insert.sh ${port} ${passwd} 1000000 256 1200 16 && ./clean_insert.sh ${port} ${passwd} 1000000 256 1200 16
echo "insert 64*1000000 64"
./prepare_insert.sh ${port} ${passwd} 1000000 64 1200 64 && ./run_insert.sh ${port} ${passwd} 1000000 64 1200 64 && ./clean_insert.sh ${port} ${passwd} 1000000 64 1200 64
echo "insert 64*1000000 128"
./prepare_insert.sh ${port} ${passwd} 1000000 128 1200 64 && ./run_insert.sh ${port} ${passwd} 1000000 128 1200 64 && ./clean_insert.sh ${port} ${passwd} 1000000 128 1200 64
echo "insert 64*1000000 256"
./prepare_insert.sh ${port} ${passwd} 1000000 256 1200 64 && ./run_insert.sh ${port} ${passwd} 1000000 256 1200 64 && ./clean_insert.sh ${port} ${passwd} 1000000 256 1200 64

# test read_write
echo "read_write 16*1000000 64"
./prepare_read_write.sh ${port} ${passwd} 1000000 64 1200 16 && ./run_read_write.sh ${port} ${passwd} 1000000 64 1200 16 && ./clean_read_write.sh ${port} ${passwd} 1000000 64 1200 16
echo "read_write 16*1000000 128"
./prepare_read_write.sh ${port} ${passwd} 1000000 128 1200 16 && ./run_read_write.sh ${port} ${passwd} 1000000 128 1200 16 && ./clean_read_write.sh ${port} ${passwd} 1000000 128 1200 16
echo "read_write 16*1000000 256"
./prepare_read_write.sh ${port} ${passwd} 1000000 256 1200 16 && ./run_read_write.sh ${port} ${passwd} 1000000 256 1200 16 && ./clean_read_write.sh ${port} ${passwd} 1000000 256 1200 16
echo "read_write 64*1000000 64"
./prepare_read_write.sh ${port} ${passwd} 1000000 64 1200 64 && ./run_read_write.sh ${port} ${passwd} 1000000 64 1200 64 && ./clean_read_write.sh ${port} ${passwd} 1000000 64 1200 64
echo "read_write 64*1000000 128"
./prepare_read_write.sh ${port} ${passwd} 1000000 128 1200 64 && ./run_read_write.sh ${port} ${passwd} 1000000 128 1200 64 && ./clean_read_write.sh ${port} ${passwd} 1000000 128 1200 64
echo "read_write 64*1000000 256"
./prepare_read_write.sh ${port} ${passwd} 1000000 256 1200 64 && ./run_read_write.sh ${port} ${passwd} 1000000 256 1200 64 && ./clean_read_write.sh ${port} ${passwd} 1000000 256 1200 64

# test update
echo "update 16*1000000 64"
./prepare_update.sh ${port} ${passwd} 1000000 64 1200 16 && ./run_update.sh ${port} ${passwd} 1000000 64 1200 16 && ./clean_update.sh ${port} ${passwd} 1000000 64 1200 16
echo "update 16*1000000 128"
./prepare_update.sh ${port} ${passwd} 1000000 128 1200 16 && ./run_update.sh ${port} ${passwd} 1000000 128 1200 16 && ./clean_update.sh ${port} ${passwd} 1000000 128 1200 16
echo "update 16*1000000 256"
./prepare_update.sh ${port} ${passwd} 1000000 256 1200 16 && ./run_update.sh ${port} ${passwd} 1000000 256 1200 16 && ./clean_update.sh ${port} ${passwd} 1000000 256 1200 16
echo "update 64*1000000 64"
./prepare_update.sh ${port} ${passwd} 1000000 64 1200 64 && ./run_update.sh ${port} ${passwd} 1000000 64 1200 64 && ./clean_update.sh ${port} ${passwd} 1000000 64 1200 64
echo "update 64*1000000 128"
./prepare_update.sh ${port} ${passwd} 1000000 128 1200 64 && ./run_update.sh ${port} ${passwd} 1000000 128 1200 64 && ./clean_update.sh ${port} ${passwd} 1000000 128 1200 64
echo "update 64*1000000 256"
./prepare_update.sh ${port} ${passwd} 1000000 256 1200 64 && ./run_update.sh ${port} ${passwd} 1000000 256 1200 64 && ./clean_update.sh ${port} ${passwd} 1000000 256 1200 64

