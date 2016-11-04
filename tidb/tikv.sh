#!/bin/bash
ulimit -n 4096

export HOST=10.9.10.121

export PD1_HOST=10.9.10.121
export PD2_HOST=10.9.184.132
export PD3_HOST=10.9.149.79

export METRICS_HOST=10.9.10.121

# unused: for listen on 0.0.0.0
# --host="${HOST}"
cd /data/deploy & exec bin/tidb-server -L=info --store=tikv -P 5000 --path="${PD1_HOST}:2379,${PD2_HOST}:2379,${PD3_HOST}:2379?cluster=1" \
    --binlog-socket=status/pump.sock \
    -lease 10 --status=10080 --log-file=logs/tidb.log --metrics-addr="${METRICS_HOST}:9091" --metrics-interval 15
