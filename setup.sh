#!/bin/bash
TARGET='__all__'

BIN_FOLDER="bin"

if [ "$1" == '' ]; then
    TARGET='__all__'
elif [ "$1" == 'vim' ]; then
    TARGET='vim'
elif [ "$1" == 'bash' ]; then
    TARGET='bash'
elif [ "$1" == 'bin' ]; then
    TARGET='bin'
elif [ "$1" == 'go' ]; then
    TARGET='go'
else
    echo "Invalid target"
    exit 1
fi


if [ $TARGET == '__all__' -o $TARGET == 'bash' ]; then
    echo -n "Enter hostname name:"
    read HOSTNAME
    echo $HOSTNAME > ~/.dotfiles/hostname
    cd ~
    FILES=(".tmux.conf" ".gitconfig" ".bash_profile" ".gitignore" ".ackrc" ".inputrc" ".agignore" ".pythonrc")
    for F in ${FILES[@]}; do
        if [ -e "$F" ]; then
            rm -rf $F;
        fi
    done
    ln -s .dotfiles/bash_profile .bash_profile
    ln -s .dotfiles/tmuxconf .tmux.conf
    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/ackrc .ackrc
    ln -s .dotfiles/inputrc .inputrc
    ln -s .dotfiles/agignore .agignore
    ln -s .dotfiles/pythonrc.py .pythonrc
fi

if [ $TARGET == '__all__' -o $TARGET == 'vim' ]; then
    cd ~
    if [ ! -e .vimfiles ]; then
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
fi

if [ ${TARGET} == '__all__' -o ${TARGET} == 'jpio' ]; then
    sudo pip3 install jpio
fi

if [ ${TARGET} == '__all__' -o ${TARGET} == 'go' ]; then
    if [ ! -e "~/.go" ]; then
        mkdir ${HOME}/.go
        pushd ${HOME}/.go
        for FDR in bin pkg src; do
            mkdir $FDR
        done
        popd
    fi
    if [ -e "~/.gopath" ]; then
        if [ -z "$(cat ~/.gopath | grep ${HOME}/.go)" ]; then
            echo "${HOME}/.go" >> ~/.gopath
        fi
    else
        echo "${HOME}/.go" >> ~/.gopath
    fi
fi
