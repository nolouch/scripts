#!/bin/bash

read -p "input first num: " a
read -p "input +-*/: " b
read -p "input second num: " c

jg=`echo "scale=2; $a $b $c" | bc `
echo "$a $b $c = $jg"
echo "=========================================================="
read -p "Do you want tp continue? y/n: " C

case $C in
    y) sh ys.sh;;
    n) exit;;
esac
