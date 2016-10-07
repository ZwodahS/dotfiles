#!/bin/bash

KERNAL_VERSION=$(uname -r)

echo "Kernal: $KERNAL_VERSION"

check_install() {
    echo "$(dpkg -s $1 2> /dev/null | grep "ok installed" | wc -l)" # return 1 or 0
}

echo "Updating ..."
apt-get update -y

for REQ in apt-transport-https ca-certificates; do
    echo "Checking $REQ"
    if [ "$(check_install $REQ)" == "0" ]; then
        echo "Installing $REQ"
        apt-get install -y ${REQ}
    else
        echo "$ REQ already installed"
    fi
done

# Check this often
echo "Adding GPG key"
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

if [ -e "/etc/apt/sources.list.d/docker.list" ]; then
    echo "Backing up old docker.list to docker.list.old"
    mv /etc/apt/sources.list.d/docker.list /etc/apt/sources.list.d/docker.list.old
fi

# getting the code name
CODENAME=$(cat /etc/*-release | grep CODENAME | cut -d '=' -f 2)
if [ "${CODENAME}" == "trusty" -o "${CODENAME}" == "xenial"  ]; then
    echo "deb https://apt.dockerproject.org/repo ubuntu-${CODENAME} main" > /etc/apt/sources.list.d/docker.list
else
    echo "Error ! OS not supported"
fi

apt-get update
if [ "$(check_install lxc-docker)" == "1" ]; then
    apt-get purge lxc-docker
fi

if [ "${CODENAME}" == "trusty" -o "${CODENAME}" == "xenial" ]; then
    for REQ in linux-image-extra-${KERNAL_VERSION} linux-image-extra-virtual; do
        echo "Checking $REQ"
        if [ "$(check_install $REQ)" == "0" ]; then
            echo "Installing $REQ"
            apt-get install -y ${REQ}
        else
            echo "$ REQ already installed"
        fi
    done
fi

echo "Installing Docker"
apt-get update
apt-get install -y docker-engine
service docker start
