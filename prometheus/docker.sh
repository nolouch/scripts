docker run -d -p 9090:9090 --name prome -v ~/docker-data/prometheus:/data prom/prometheus -config.file=/data/prometheus.yml
