#!/bin/bash
ulimit -n 40960

HOST=10.9.10.121
NAME=pd1
PD1_HOST=10.9.10.121
PD2_HOST=10.9.184.132
PD3_HOST=10.9.149.79


cd /data/deploy && exec bin/pd-server \
        --cluster-id=1 \
        --data-dir=pd \
        --config=conf/pd.toml \
        --log-file=logs/pd.log \
        --client-urls="http://${HOST}:2379" --peer-urls="http://${HOST}:2380" \
        --name="${NAME}" \
        --initial-cluster="pd1=http://${PD1_HOST}:2380,pd2=http://${PD2_HOST}:2380,pd3=http://${PD3_HOST}:2380"
