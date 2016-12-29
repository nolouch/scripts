#!/bin/bash
# statistic_worlds.sh

if [ $# -lt 1 ]; then
    echo "Usage: basename $0 FILE WORLDS ...."
    exit -1
fi

FIFE=$1
((WORDS_NUM=$#-1))

for n in $(seq $WORDS_NUM)
do
    shift
    cat $FIFE | sed -e "s/[^a-zA-Z]/\n/g" \
        | grep -v ^$ | sort | grep ^$1$ | uniq -c
done
