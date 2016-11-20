#!/bin/bash

DATE=`date +%F`

tar -cvf /etc/-$DATE /etc
mkdir /home/$USER/backup
mv /etc-$DATE /home/$USER/backup
