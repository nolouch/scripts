#!/bin/bash
ssh pingcap@192.168.199.141 "cd $HOME/deploy; nohup ./tikv.sh </dev/null >/dev/null 2>&1&"
ssh pingcap@192.168.199.142 "cd $HOME/deploy; nohup ./tikv.sh </dev/null >/dev/null 2>&1&"
ssh pingcap@192.168.199.143 "cd $HOME/deploy; nohup ./tikv.sh </dev/null >/dev/null 2>&1&"
