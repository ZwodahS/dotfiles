#!/bin/bash

# define the bash directory for the different bash script
DOTFILES=~/.dotfiles
export DOTFILES
bashdir=${DOTFILES}/bash

# source the different bash
modules=()
modules+=('bash_common')
modules+=('bash_color')
modules+=('bash_util_functions')
modules+=('path')
modules+=('apparix')
modules+=('python')
modules+=('tmux')
modules+=('history')
modules+=('javascript')
modules+=('golang')
modules+=('git')
modules+=('git_auto')
modules+=('tig')
modules+=('ps')
modules+=('buku')
modules+=('fzf')
modules+=('docker')

# only for local
if [ -e "${DOTFILES}/local" ]; then
    modules+=('ssh')
    source "${DOTFILES}/local"
fi
for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
