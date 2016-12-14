#!/bin/bash
export MYSQL_HOST=127.0.0.1
port=4000
database="test"

# test select
echo "select 32*1000000 128"
./prepare.sh ${port} ${database} 1000000  32
./run_read_only.sh ${port} "" 1000000 128 1200 32
sleep 60
echo "select 32*1000000 256"
./run_read_only.sh ${port} "" 1000000 256 1200 32
sleep 60
echo "select 32*1000000 612"
./run_read_only.sh ${port} "" 1000000 612 1200 32
./reset1.sh
echo "select 64*1000000 128"
./prepare.sh ${port} ${database} 1000000  64
./run_read_only.sh ${port} "" 1000000 128 1200 64
sleep 60
echo "select 64*1000000 256"
./run_read_only.sh ${port} "" 1000000 256 1200 64
sleep 60
echo "select 64*1000000 612"
./run_read_only.sh ${port} "" 1000000 612 1200 64
./reset1.sh

# test insert
echo "insert 32*1000000 128"
./prepare.sh ${port} ${database} 1000000  32 && ./run_insert.sh ${port} "" 1000000 128 1200 32 && ./reset1.sh
echo "insert 32*1000000 256"
./prepare.sh ${port} ${database} 1000000  32 && ./run_insert.sh ${port} "" 1000000 256 1200 32 && ./reset1.sh
echo "insert 32*1000000 612"
./prepare.sh ${port} ${database} 1000000  32 && ./run_insert.sh ${port} "" 1000000 612 1200 32 && ./reset1.sh
echo "insert 64*1000000 128"
./prepare.sh ${port} ${database} 1000000  64 && ./run_insert.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "insert 64*1000000 256"
./prepare.sh ${port} ${database} 1000000  64 && ./run_insert.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh
echo "insert 64*1000000 612"
./prepare.sh ${port} ${database} 1000000  64 && ./run_insert.sh ${port} "" 1000000 612 1200 64 && ./reset1.sh

# test read_write
echo "read_write 32*1000000 128"
./prepare.sh ${port} ${database} 1000000  32 && ./run_read_write.sh ${port} "" 1000000 128 1200 32 && ./reset1.sh
echo "read_write 32*1000000 256"
./prepare.sh ${port} ${database} 1000000  32 && ./run_read_write.sh ${port} "" 1000000 256 1200 32 && ./reset1.sh
echo "read_write 32*1000000 612"
./prepare.sh ${port} ${database} 1000000  32 && ./run_read_write.sh ${port} "" 1000000 612 1200 32 && ./reset1.sh
echo "read_write 64*1000000 128"
./prepare.sh ${port} ${database} 1000000  64 && ./run_read_write.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "read_write 64*1000000 256"
./prepare.sh ${port} ${database} 1000000  64 && ./run_read_write.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh
echo "read_write 64*1000000 612"
./prepare.sh ${port} ${database} 1000000  64 && ./run_read_write.sh ${port} "" 1000000 612 1200 64 && ./reset1.sh

# test update
echo "update 32*1000000 128"
./prepare.sh ${port} ${database} 1000000  32 && ./run_update.sh ${port} "" 1000000 128 1200 32 && ./reset1.sh
echo "update 32*1000000 256"
./prepare.sh ${port} ${database} 1000000  32 && ./run_update.sh ${port} "" 1000000 256 1200 32 && ./reset1.sh
echo "update 32*1000000 512"
./prepare.sh ${port} ${database} 1000000  32 && ./run_update.sh ${port} "" 1000000 612 1200 32 && ./reset1.sh
echo "update 64*1000000 128"
./prepare.sh ${port} ${database} 1000000  64 && ./run_update.sh ${port} "" 1000000 128 1200 64 && ./reset1.sh
echo "update 64*1000000 256"
./prepare.sh ${port} ${database} 1000000  64 && ./run_update.sh ${port} "" 1000000 256 1200 64 && ./reset1.sh
echo "update 64*1000000 612"
./prepare.sh ${port} ${database} 1000000  64 && ./run_update.sh ${port} "" 1000000 612 1200 64 && ./reset1.sh
