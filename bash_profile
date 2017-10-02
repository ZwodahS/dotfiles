#!/bin/bash

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/.zdotfiles/bash

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
modules+=('golang')
modules+=('git')
modules+=('git_auto')
modules+=('tig')
modules+=('ps')
modules+=('buku')
modules+=('fzf')
modules+=('docker')

# only for local
#modules+=('ssh')
for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
