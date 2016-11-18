#!/bin/bash
wget -c http://int64.me

cat index.html | sed -e "s/[^a-zA-Z]/\n/g" | grep -v ^$ | sort | uniq -c
