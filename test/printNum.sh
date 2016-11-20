#!/bin/bash

for((i=0; i<=9; i++))
do
    j=$i
    for((j;j>=0;j--))
    do
        echo -n "$j"
    done
    k=1
    for((k; k<=$i; k++))
    do
        echo -n "$k"
    done
    echo
done
