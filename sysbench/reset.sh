#!/bin/bash

# clean pd, tidb
./clean_pd_tidb.sh

# clean tikv
./clean_tikv.sh

cd $HOME/work/scripts/sysbench
./start_pd.sh
# start tikv
./start_tikv.sh

./start_tidb.sh



