#!/bin/bash
echo "==================create the group====================="
read -p "input the groupname what you want to create:" a

A=`cut -d: -f1 /etc/group|grep $a|wc -w`

if [ $A -eq 1 ]
then
    echo "groupname already exist, please go ahead"

else
    groupadd $a
fi

echo "==================how many users you want to add============"
read -p "input the numbers of users: " num
count=1

while [ $count -le $num  ]
do
    B=`cut -d: -f1 /etc/passwd|grep ${a}Student$count|wc -w`
    if [ $B -eq 1 ]
    then
        echo "The user ${a}Student$count is already exist"
    else
        useradd -G $a ${a}Student$count
        echo "user ${a}Student$count add successfully"
    fi
    count=$(($count + 1))
done

read -p "do you want remove the new users? y or n: " do


let count=count-1
if [ "$do" = y ]
then
    for((count; count >=1; count--))
    do
        userdel -r ${a}Student$count
        echo "user ${a}Student$count del successfully"
    done
else exit
fi
