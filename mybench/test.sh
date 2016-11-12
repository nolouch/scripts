#!/bin/bash 
#test 100w  
passwd="" 
port=4000
count=500000
worker=128

bash clean.sh > /dev/null 
sleep 60 

bash import.sh ${port} ${count}
sleep 60 
echo ""
echo "***********50W order Read***********"
bench mysql  -P ${port} --case-path=./caseT/case50/order_read.case --worker-count=${worker} -t=true
sleep 60 
echo ""
echo "***********50w order write**********" 
bench mysql  -P ${port} --case-path=./caseT/case50/order_write.case --worker-count=${worker} -t=true
sleep 20 
bash clean.sh > /dev/null 
sleep 60 

count=1000000
bash import.sh ${port} ${count}
sleep 60 
echo ""
echo "***********100W order Read***********"
bench mysql -P ${port} --case-path=./caseT/case100/order_read.case --worker-count=${worker} -t=true
sleep 60 
echo ""
echo "***********100w order write**********" 
bench mysql -P ${port} --case-path=./caseT/case100/order_write.case --worker-count=${worker} --clean=true -t=true
sleep 20 
bash clean.sh > /dev/null 
sleep 60 

count=5000000 
bash import.sh ${port} ${count}
sleep 60 
echo ""
echo "***********500W order Read***********"
bench mysql  -P ${port} --case-path=./caseT/case500/order_read.case --worker-count=${worker} -t=true
sleep 60 
echo ""
echo "***********500w order write**********" 
bench mysql -P ${port} --case-path=./caseT/case500/order_write.case --worker-count=${worker} --clean=true -t=true
sleep 20 
bash clean.sh > /dev/null 
sleep 60 

count=10000000 
bash import.sh ${port} ${count}
sleep 60 
echo ""
echo "***********1000W order Read**********"
bench mysql -P ${port} --case-path=./caseT/case1000/order_read.case --worker-count=${worker} -t=true
sleep 60 
echo ""
echo "***********1000w order write*********" 
bench mysql -P ${port} --case-path=./caseT/case1000/order_write.case --worker-count=${worker} --clean=true -t=true
sleep 20 
bash clean.sh > /dev/null 
sleep 60 

count=50000000 
bash import.sh ${port} ${count}
sleep 60 
echo ""
echo "***********5000W order Read**********"
bench mysql -P ${port} --case-path=./caseT/case5000/order_read.case --worker-count=${worker} -t=true
sleep 60 
echo ""
echo "***********5000w order write*********" 
bench mysql -P ${port} --case-path=./caseT/case5000/order_write.case --worker-count=${worker} --clean=true -t=true

