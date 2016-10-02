#!/bin/bash

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/.dotfiles/bash

# source the different bash
# comment/uncomment when necessary
modules=()
modules+=('bash_common')
modules+=('bash_util_functions')
modules+=('linux')
#modules+=('unix')
modules+=('path')
modules+=('git_auto')
#modules+=('ruby')
#modules+=('apparix')
#modules+=('ssh')
modules+=('python')
modules+=('tmux')
modules+=('history')
modules+=('golang')
modules+=('javascript')
modules+=('git')
for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
__git_complete git _git
__git_complete g _git
