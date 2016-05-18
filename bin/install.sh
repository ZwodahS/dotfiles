#!/bin/bash

# install random shits
# install mongodb from 10gen
# http://www.mkyong.com/mongodb/how-to-install-mongodb-on-ubuntu/

if [ -z "$1" ]; then
    echo "Enter packages to install"
    exit 1
fi

if [ "$1" == "repo-mongoorg" ]; then
    if [ -e "/etc/apt/sources.list.d/mongo.list" ]; then
        echo "file /etc/apt/sources.list.d/mongo.list. Please backup."
        exit 1
    fi
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongo.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    sudo apt-get update

    echo "mongoorg Repo added"
    echo "available installs:"
    echo "    mongodb-org"
    echo "    mongodb-org-server"
    echo "    mongodb-org-mongos"
    echo "    mongodb-org-shell"
    echo "    mongodb-org-tools"
fi
