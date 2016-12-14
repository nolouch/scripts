#!/bin/bash
export MYSQL_HOST=127.0.0.1
port=4000
database="test"
size=1000000

# test select
echo "select 32*${size} 128"
./prepare.sh ${port} ${database} ${size}  32
./run_read_only.sh ${port} "" ${size} 128 1200 32
sleep 60
echo "select 32*${size} 256"
./run_read_only.sh ${port} "" ${size} 256 1200 32
sleep 60
echo "select 32*${size} 612"
./run_read_only.sh ${port} "" ${size} 612 1200 32
./reset1.sh
echo "select 64*${size} 128"
./prepare.sh ${port} ${database} ${size}  64
./run_read_only.sh ${port} "" ${size} 128 1200 64
sleep 60
echo "select 64*${size} 256"
./run_read_only.sh ${port} "" ${size} 256 1200 64
sleep 60
echo "select 64*${size} 612"
./run_read_only.sh ${port} "" ${size} 612 1200 64
./reset1.sh

# test insert
echo "insert 32*${size} 128"
./prepare.sh ${port} ${database} ${size}  32 && ./run_insert.sh ${port} "" ${size} 128 1200 32 && ./reset1.sh
echo "insert 32*${size} 256"
./prepare.sh ${port} ${database} ${size}  32 && ./run_insert.sh ${port} "" ${size} 256 1200 32 && ./reset1.sh
echo "insert 32*${size} 612"
./prepare.sh ${port} ${database} ${size}  32 && ./run_insert.sh ${port} "" ${size} 612 1200 32 && ./reset1.sh
echo "insert 64*${size} 128"
./prepare.sh ${port} ${database} ${size}  64 && ./run_insert.sh ${port} "" ${size} 128 1200 64 && ./reset1.sh
echo "insert 64*${size} 256"
./prepare.sh ${port} ${database} ${size}  64 && ./run_insert.sh ${port} "" ${size} 256 1200 64 && ./reset1.sh
echo "insert 64*${size} 612"
./prepare.sh ${port} ${database} ${size}  64 && ./run_insert.sh ${port} "" ${size} 612 1200 64 && ./reset1.sh

# test read_write
echo "read_write 32*${size} 128"
./prepare.sh ${port} ${database} ${size}  32 && ./run_read_write.sh ${port} "" ${size} 128 1200 32 && ./reset1.sh
echo "read_write 32*${size} 256"
./prepare.sh ${port} ${database} ${size}  32 && ./run_read_write.sh ${port} "" ${size} 256 1200 32 && ./reset1.sh
echo "read_write 32*${size} 612"
./prepare.sh ${port} ${database} ${size}  32 && ./run_read_write.sh ${port} "" ${size} 612 1200 32 && ./reset1.sh
echo "read_write 64*${size} 128"
./prepare.sh ${port} ${database} ${size}  64 && ./run_read_write.sh ${port} "" ${size} 128 1200 64 && ./reset1.sh
echo "read_write 64*${size} 256"
./prepare.sh ${port} ${database} ${size}  64 && ./run_read_write.sh ${port} "" ${size} 256 1200 64 && ./reset1.sh
echo "read_write 64*${size} 612"
./prepare.sh ${port} ${database} ${size}  64 && ./run_read_write.sh ${port} "" ${size} 612 1200 64 && ./reset1.sh

# test update
echo "update 32*${size} 128"
./prepare.sh ${port} ${database} ${size}  32 && ./run_update.sh ${port} "" ${size} 128 1200 32 && ./reset1.sh
echo "update 32*${size} 256"
./prepare.sh ${port} ${database} ${size}  32 && ./run_update.sh ${port} "" ${size} 256 1200 32 && ./reset1.sh
echo "update 32*${size} 512"
./prepare.sh ${port} ${database} ${size}  32 && ./run_update.sh ${port} "" ${size} 612 1200 32 && ./reset1.sh
echo "update 64*${size} 128"
./prepare.sh ${port} ${database} ${size}  64 && ./run_update.sh ${port} "" ${size} 128 1200 64 && ./reset1.sh
echo "update 64*${size} 256"
./prepare.sh ${port} ${database} ${size}  64 && ./run_update.sh ${port} "" ${size} 256 1200 64 && ./reset1.sh
echo "update 64*${size} 612"
./prepare.sh ${port} ${database} ${size}  64 && ./run_update.sh ${port} "" ${size} 612 1200 64 && ./reset1.sh
