#!/bin/bash

if [ "$1" = "" ]
then
    echo "Enter file to encrypt";
else
    openssl des3 -salt -out "$1".x -in "$1"
fi
