if  [ $# != 3 ];  then
    echo "Usage: $0 passwd port count"
    exit 1
fi

port=$1
passwd=$2
count=$3

import -t "create table t(a bigint primary key, b double, c varchar(10));"  \
       -i "create unique index u_b on t(b);"  \
       -h  127.0.0.1  -P ${port} -D test -p ${passwd}  \
       -n ${count}  \
       -c 100 -b 100
