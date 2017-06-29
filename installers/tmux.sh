#!/usr/bin/env bash
SOURCE=$1

if [ "$SOURCE" == "github" ]; then
    git clone git@github.com:tmux/tmux --depth=1
    pushd tmux
    sudo apt-get install -y libevent-dev libncurses5-dev
    ./configure
    make
    popd
else
    sudo add-apt-repository -y ppa:pi-rho/dev
    sudo apt-get update
    sudo apt-get install -y tmux=1.9a-1~ppa1~t
fi
