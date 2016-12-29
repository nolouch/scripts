#!/bin/bash

if test -n "not empty"; then echo "YES"; else echo "NO"; fi

if test -z "not empty"; then echo "YES"; else echo "NO"; fi

if test -z ""; then echo "YES"; else echo "NO"; fi

if test -n ""; then echo "YES"; else echo "NO"; fi
