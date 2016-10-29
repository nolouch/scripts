./bin/pd-server --cluster-id=1 \
                --name=pd1 \
                --data-dir=/data/pd  \
                --client-urls="http://192.168.199.141:2379" \
                --peer-urls="http://192.168.199.141:2380" \
                --initial-cluster="pd1=http://192.168.199.141:2380,pd2=http://192.168.199.142:2380,pd3=http://192.168.199.143:2380"  \
		-log-file /tmp/pd-server.log  \
        --config pd_metric.toml & 


