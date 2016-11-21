#!/bin/bash
# clean pd
kill -9 $(pgrep -f "pd-server")
rm -r /data/pd

# clean tidb
kill -9 $(pgrep -f "tidb-server")


