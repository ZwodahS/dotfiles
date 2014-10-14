#!/bin/bash 

# this is a template for bash_profile. Do not do sym link to it. Instead, copy it

# define the bash directory for the different bash script
bashdir=~/Data/terminal/bash

# source the different bash
# for some standard unix command
source $bashdir/unix_bash
# for path
source $bashdir/path_bash
# for git
source $bashdir/git_bash
# for ruby
source $bashdir/ruby_bash
source $bashdir/apparix_bash
source $bashdir/ssh_bash
source $bashdir/python_bash
source $bashdir/tmux_bash
source $bashdir/git_auto_bash

