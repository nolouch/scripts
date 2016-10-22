# PD
$HOME/tidb/tidb-latest-linux-amd64/bin/pd-server --cluster-id=1  --name=pd1 --data-dir=/tmp/pd1  --client-urls="http://127.0.0.1:2377"  --peer-urls="http://127.0.0.1:2380"  --initial-cluster="pd1=http://127.0.0.1:2380,pd2=http://127.0.0.1:2381,pd3=http://127.0.0.1:2382" -log-file /tmp/pd-server1.log &
sleep 1
$HOME/tidb/tidb-latest-linux-amd64/bin/pd-server --cluster-id=1 --name=pd2  --data-dir=/tmp/pd2  --client-urls="http://127.0.0.1:2378"  --peer-urls="http://127.0.0.1:2381" --initial-cluster="pd1=http://127.0.0.1:2380,pd2=http://127.0.0.1:2381,pd3=http://127.0.0.1:2382" -log-file /tmp/pd-server2.log &
sleep 1
$HOME/tidb/tidb-latest-linux-amd64/bin/pd-server --cluster-id=1  --name=pd3  --data-dir=/tmp/pd3  --client-urls="http://127.0.0.1:2379" --peer-urls="http://127.0.0.1:2382"  --initial-cluster="pd1=http://127.0.0.1:2380,pd2=http://127.0.0.1:2381,pd3=http://127.0.0.1:2382" -log-file /tmp/pd-server3.log &
sleep 15

# TiKV
$HOME/tidb/tidb-latest-linux-amd64/bin/tikv-server -S raftkv  -I 1  --pd 127.0.0.1:2377,127.0.0.1:2378,127.0.0.1:2379  --addr 127.0.0.1:20160  -s /tmp/tikv1  --log-file /tmp/tikv-server1.log &
sleep 1
$HOME/tidb/tidb-latest-linux-amd64/bin/tikv-server -S raftkv -I 1  --pd 127.0.0.1:2377,127.0.0.1:2378,127.0.0.1:2379  --addr 127.0.0.1:20161  -s /tmp/tikv2  --log-file /tmp/tikv-server2.log &
sleep 1
$HOME/tidb/tidb-latest-linux-amd64/bin/tikv-server -S raftkv -I 1  --pd 127.0.0.1:2377,127.0.0.1:2378,127.0.0.1:2379  --addr 127.0.0.1:20162  -s /tmp/tikv3 --log-file /tmp/tikv-server3.log &
sleep 25

#TiDB
$HOME/tidb/tidb-latest-linux-amd64/bin/tidb-server --store=tikv --path="127.0.0.1:2377,127.0.0.1:2378,127.0.0.1:2379?cluster=1" -log-file /tmp/tidb-server.log &
