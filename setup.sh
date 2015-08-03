#!/bin/bash
TARGET='__all__'

if [ "$1" == '' ]; then
    TARGET='__all__'
elif [ "$1" == 'vim' ]; then
    TARGET='vim'
elif [ "$1" == 'bash' ]; then
    TARGET='bash'
elif [ "$1" == 'bin' ]; then
    TARGET='bin'
else
    echo "Invalid target"
    exit 1
fi


if [ $TARGET == '__all__' -o $TARGET == 'bash' ]; then
    echo -n "Enter hostname name:"
    read HOSTNAME
    echo $HOSTNAME > ~/.dotfiles/hostname
    cd ~
    if [ -e .tmux.conf ]; then
        rm -f .tmux.conf
    fi
    ln -s .dotfiles/tmuxconf .tmux.conf

    if [ -e .gitconfig ]; then
        rm -f .gitconfig
    fi
    ln -s .dotfiles/gitconfig .gitconfig

    if [ -e .bash_profile ]; then
        rm -f .bash_profile
    fi
    cp .dotfiles/bash_profile .bash_profile

    if [ -e .gitignore ]; then
        rm -f .gitignore
    fi
    ln -s .dotfiles/gitignore .gitignore

    if [ -e .ackrc ]; then
        rm -f .ackrc
    fi
    ln -s .dotfiles/ackrc .ackrc
    ln -s .dotfiles/inputrc .inputrc
fi

if [ $TARGET == '__all__' -o $TARGET == 'vim' ]; then
    cd ~
    if [ -e .vimfiles ]; then
        rm -rf .vimfiles
    fi
    git clone git@github.com:zwodahs/vimfiles .vimfiles
    ln -s .vimfiles .vim
    cd .vim
    ./setup.sh
    cd ~

    if [ -e .vimrc ]; then
        rm -rf .vimrc
    fi
    ln -s .vim/vimrc .vimrc
fi

if [ $TARGET == '__all__' -o $TARGET == 'bin' ]; then
    cd ~
    if [ ! -e bin ]; then
        mkdir bin
    fi
    cd bin
    ln -s ~/.dotfiles/bin/* .
    cd ~
fi
