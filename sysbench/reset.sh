#!/bin/bash

# clean pd, tidb
./clean_pd_tidb.sh

# clean tikv
./clean_tikv.sh

# start pd
cd $HOME/deploy
nohup ./pd.sh </dev/null >/dev/null 2>&1&

# start tikv
cd $HOME/work/scripts/sysbench
./start_tikv.sh

# start tidb
cd $HOME/deploy
nohup ./tikv.sh </dev/null >/dev/null 2>&1&

