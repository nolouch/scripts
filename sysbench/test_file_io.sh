sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw prepare
sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw run
sysbench --num-threads=16 --test=fileio --file-total-size=5G --file-test-mode=rndrw cleanup
