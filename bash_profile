#!/bin/bash

# define the bash directory for the different bash script
DOTFILES=~/.dotfiles
export DOTFILES
bashdir=${DOTFILES}/bash

# only for local
if [ -e "${DOTFILES}/local" ]; then
    source "${DOTFILES}/local"
fi

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
modules+=('kube')
for f in ${modules[@]}
do
    if [ -e $bashdir/$f ]
    then
        source $bashdir/$f
    fi
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

shopt -s autocd
shopt -s globstar
