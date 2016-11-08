sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw prepare
sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw --max-requests=1000000000 --max-time=180 --file-extra-flags=direct --file-fsync-freq=0 --file-block-size=16384  run
sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw cleanup
