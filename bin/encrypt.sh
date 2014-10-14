#!/bin/bash

if [ "$1" = "" ]
then
    echo "Enter file to encrypt";
else
    openssl des -salt -out "$1".x -in "$1"
fi
