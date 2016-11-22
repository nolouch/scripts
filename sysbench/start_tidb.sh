#!/bin/bash
# start tidb
cd $HOME/deploy
nohup ./tikv.sh </dev/null >/dev/null 2>&1&
