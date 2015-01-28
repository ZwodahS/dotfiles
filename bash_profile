#!/bin/bash 

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/.dotfiles/bash

# source the different bash
# comment/uncomment when necessary
modules=()
modules+=('bash_common')
modules+=('linux')
#modules+=('unix')
modules+=('path')
modules+=('git')
modules+=('git_auto')
#modules+=('ruby')
#modules+=('apparix')
#modules+=('ssh')
modules+=('python')
modules+=('tmux')
modules+=('history')
for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
