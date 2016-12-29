#!/bin/bash

function addFile() {
    for((i=1; i<=10; i++))
    do
        mkdir /usr/src/dir$i
        chmod 755 -R /usr/src/dir$i
        for((j=1; j<=10; j++))
        do
            touch /usr/src/dir$i/dir${i}file$j
        done
    done
}

read -p "which files(1~10) do you want to option:" num

addFile

ls /usr/src/dir$num  >> /usr/src/fileOut.txt

cd /usr/src/dir$num
for f in `ls /usr/src/dir$num`
do
    mv $f $f.bak
done

echo "option successfully"
read -p "are you sure to remove this directory which with this number:" op

case $op in
    y)
        rm -rf /usr/src/dir$num ;;
    *)
        exit;;
esac
