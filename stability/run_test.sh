#!/bin/bash 
nohup ./stability_test -c config.toml -log-file slog.log >> nohup.log 2&1 &
