sysbench --test=cpu --num-threads=`grep "processor" /proc/cpuinfo | wc -l` \
                    --cpu-max-prime=200000 run
