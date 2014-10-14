#!/bin/bash

if [ "$1" = "" ]
then
    echo "Enter file to decrypt"
else
    openssl des3 -salt -d -in "$1"
fi
