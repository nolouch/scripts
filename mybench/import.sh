if  [ $# != 2 ];  then
    echo "Usage: $0 port count"
    exit 1
fi

port=$1
#passwd=$2
count=$2

importer -t "create table t(a bigint primary key, b double, c varchar(10));"  \
       -i "create unique index u_b on t(b);"  \
       -h  127.0.0.1  -P ${port} -D test   \
       -n ${count}  \
       -c 100 -b 100
