#!/bin/bash 

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/.dotfiles/bash

# source the different bash

modules=('unix' 'path' 'git' 'ruby' 'apparix' 'ssh' 'python' 'tmux' 'git_auto')
for f in modules
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done
