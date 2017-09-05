#!/bin/bash

if [ ! -e ~/.tmux/plugins ]; then
    mkdir -p ~/.tmux/plugins
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
