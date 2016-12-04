#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: $0 password"
    exit 1
fi

passwd=$1

numbers=("130405212" "130405215" "130405211" "130405216" "130405209" "130405206" "130405228")

for one in ${numbers[@]};do
    selectCmd="select s_id from sim join solution where solution.user_id =${one} and sim.s_id = solution.solution_id"
    s_ids=$(mysql -uroot -p"${passwd}" -D jol -s -e "${selectCmd}")
    for id in ${s_ids[@]};do
       echo "delete from sim where s_id = ${id};"
   done | mysql -uroot -p"${passwd}" -D jol
done
