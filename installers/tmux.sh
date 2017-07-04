#!/usr/bin/env bash
SOURCE=$1

if [ "$SOURCE" == "wget" ]; then
    wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
    tar -xvf tmux-2.5.tar.gz
    pushd tmux-2.5
    sudo apt-get install -y libevent-dev libncurses5-dev
    ./configure
    make
    sudo make install
    popd
else
    sudo add-apt-repository -y ppa:pi-rho/dev
    sudo apt-get update
    sudo apt-get install -y tmux=1.9a-1~ppa1~t
fi
