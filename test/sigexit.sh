#!/bin/bash

function signal_handler {
    echo "hello world"
}

trap signal_handler 0
