#!/usr/bin/env bash

if [ "$1" == '' ]; then
    echo 'encrypt <file_in> <algorithm[des3|aes] $others'
    exit 1
fi

FILE=$1
ALGO=aes
if [ "$2" == 'aes' -o "$2" == 'des' ]; then
    ALGO=$2
fi
shift
shift
if [ "$ALGO" == 'aes' ]; then
    ALGO='aes-256-cbc'
elif [ "$ALGO" == 'des' ]; then
    ALGO='des3'
fi
openssl $ALGO -a -salt -in $FILE -out ${FILE}.x $*
