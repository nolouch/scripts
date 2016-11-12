#!/bin/bash 
#test 100w  
passwd="" 
port=4000
count=500000
worker=1

bash clean.sh > /dev/null 
sleep 30 

count=1000000
bash import.sh ${port} ${count}
sleep 30 
echo ""
echo "***********100W order Read***********"
bench mysql -P ${port} --case-path=./caseT/case50/order_read.case --worker-count=${worker} 
sleep 30 
echo ""
echo "***********100w order write**********" 
bench mysql -P ${port} --case-path=./caseT/case10/order_write.case --worker-count=${worker} 
sleep 20 
bash clean.sh > /dev/null 
sleep 30 

count=5000000 
bash import.sh ${port} ${count}
sleep 30 
echo ""
echo "***********500W order Read***********"
bench mysql  -P ${port} --case-path=./caseT/case50/order_read.case --worker-count=${worker} 
sleep 30 
echo ""
echo "***********500w order write**********" 
bench mysql -P ${port} --case-path=./caseT/case10/order_write.case --worker-count=${worker} 
sleep 20 
bash clean.sh > /dev/null 
sleep 30 

count=10000000 
bash import.sh ${port} ${count}
sleep 30 
echo ""
echo "***********1000W order Read**********"
bench mysql -P ${port} --case-path=./caseT/case50/order_read.case --worker-count=${worker} 
sleep 30 
echo ""
echo "***********1000w order write*********" 
bench mysql -P ${port} --case-path=./caseT/case10/order_write.case --worker-count=${worker} 
sleep 20 
bash clean.sh > /dev/null 
sleep 30 

