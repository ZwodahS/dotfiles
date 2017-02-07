#!/bin/bash

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/.dotfiles/bash

# source the different bash
# comment/uncomment when necessary
modules=()
modules+=('bash_common')
modules+=('bash_util_functions')
modules+=('path')
modules+=('apparix')
#modules+=('ssh')
modules+=('python')
modules+=('tmux')
modules+=('history')
modules+=('golang')
modules+=('javascript')
modules+=('git')
modules+=('git_auto')
modules+=('tig')
modules+=('buku')

for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
