$HOME/tidb/tidb-latest-linux-amd64/bin/pd-server --cluster-id=1 --data-dir=$HOME/tidb/pd -log-file /tmp/pd-server.log &
sleep 2
$HOME/tidb/tidb-latest-linux-amd64/bin/tikv-server -I 1 -S raftkv --pd 127.0.0.1:2379 -s $HOME/tidb/tikv --log-file /tmp/tikv-server.log &
sleep 5
$HOME/tidb/tidb-latest-linux-amd64/bin/tidb-server --store=tikv --path="127.0.0.1:2379?cluster=1" -log-file /tmp/tidb-server.log &

