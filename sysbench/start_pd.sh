#!/bin/bash
# start pd
cd $HOME/deploy
nohup ./pd.sh </dev/null >/dev/null 2>&1&
