#!/bin/bash
today=`date -d yesterday +%y%m%d`
file="apache_$tody.tar.gz"
cd /home/cwen/tool/scripts
if [ -f "$file" ]; then
    echo "OK"
else
    echo "error $file" > error.log
    mail -s "fail backup from test" cwenyin0@gmail.com <error.log
fi
