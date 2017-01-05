#!/bin/bash

sudo apt-get update && \
sudo apt-get install -y software-properties-common python-software-properties && \
sudo add-apt-repository ppa:neovim-ppa/unstable && \
sudo apt-get update && \
sudo apt-get install neovim
