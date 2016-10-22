# redis master
docker run -it -d --name redis-master daocloud.io/library/redis:3.0.7 /bin/bash
docker exec redis-master wget https://raw.githubusercontent.com/cwen0/scripts/master/redis/redis-master.conf /data
docker exec redis-master redis-server /data/redis-master.conf

# redis slave
docker run -it -d --name redis-slave1 --link redis-master:master daocloud.io/library/redis:3.0.7 /bin/bash
docker exec redis-slave1 wget https://raw.githubusercontent.com/cwen0/scripts/master/redis/redis-slave.conf /data
docker exec redis-slave1 redis-server /data/redis-slave.conf

docker run -it -d --name redis-slave2 --link redis-master:master daocloud.io/library/redis:3.0.7 /bin/bash
docker exec redis-slave2 wget https://raw.githubusercontent.com/cwen0/scripts/master/redis/redis-slave.conf /data
docker exec redis-slave2 redis-server /data/redis-slave.conf
