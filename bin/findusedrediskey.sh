#!/usr/bin/env bash

if [ -z "$1" -o -z "$2" ]; then
    echo "$(basename $0) <host> <port>"
    exit 1
fi

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15;
do
    STRING=$(redis-cli -h $1 -p $2 -n $i DBSIZE | cut -d ' ' -f 2)
    if [ "$STRING" == "0" ]; then
        echo $i "not used"
    else
        echo $i "in use"
    fi
done
