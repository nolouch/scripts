#!/bin/bash
ulimit -n 1000000

export HOST=10.9.13.159
export PD1_HOST=10.9.10.121
export PD2_HOST=10.9.184.132
export PD3_HOST=10.9.149.79

export RUST_BACKTRACE=1
cd /data/deploy && exec bin/tikv-server --addr "${HOST}:5551"  --pd "${PD1_HOST}:2379,${PD2_HOST}:2379,${PD3_HOST}:2379" -s data --cluster-id 1 -L info --capacity 256gb --config conf/tikv.toml --log-file logs/tikv.log
