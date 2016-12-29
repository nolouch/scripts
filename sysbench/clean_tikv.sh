#!/bin/bash
ssh pingcap@192.168.199.141 "kill -9 \$(pgrep -f \"tikv-server\"); rm -r /data/tikv"
ssh pingcap@192.168.199.142 "kill -9 \$(pgrep -f \"tikv-server\"); rm -r /data/tikv"
ssh pingcap@192.168.199.143 "kill -9 \$(pgrep -f \"tikv-server\"); rm -r /data/tikv"
