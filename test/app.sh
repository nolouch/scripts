#!/bin/bash

FIFO=fifo_test
while :;
do
    CI=`cat $FIFO` #CI --> Control Info
    case $CI in
        0) echo "The CONTROL number is ZERO, do something..."
            ;;
        1) echo "The CONTROL number is ONE, do something..."
            ;;
        *) echo "The CONTRL number not recognized, do something else..."
            ;;
    esac
done
