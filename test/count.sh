#!/bin/bash

grep "aa.*" /etc/passwd|cut -d : -f1 >> /home/luzy/practice1/text/file1
echo '****************' >> /home/luzy/practice1/text/file1

ls /bin | grep "ls.*" >> /home/luzy/practice1/text/file1
echo '****************' >> /home/luzy/practice1/text/file1

ls /bin /sbin >> /home/luzy/practice1/text/command
ls /bin | wc -l  >> /home/luzy/practice1/text/file1
ls /sbin | wc -l  >> /home/luzy/practice1/text/file1
