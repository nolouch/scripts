#!/bin/bash
kill -9 $(pgrep -f "tidb-server")
kill -9 $(pgrep -f "pd-server")
rm -r /data/pd

./expect_clean.exp

nohup /home/pingcap/deploy/pd.sh </dev/null >/dev/null 2>&1& 

./expect_start.exp

echo "ee" 
nohup /home/pingcap/deploy/tidb.sh </dev/null >/dev/null 2>&1& 

