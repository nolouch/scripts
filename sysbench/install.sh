#! /bin/bash
apt-get install gcc gcc-c++ automake make  libtool mysql-community-devel
cd /tmp && clone https://github.com/akopytov/sysbench.git
cd /tmp/sysbench && ./autogen.sh
./configure --prefix=/usr/local/sysbench-0.5
./make && sudo make install
cd /usr/local/sysbench && sudo mkdir -p share/tests/db
cp /tmp/sysbench/sysbench/tests/db/*.lua share/tests/db/

