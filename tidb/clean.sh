kill -9 $(pgrep -f "tidb")
rm -r $HOME/tidb/pd
rm -r $HOME/tidb/tikv
