#!/bin/bash
TARGET='__all__'
DOTFILES_PATH=$(pwd)

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
    echo $HOSTNAME > ${DOTFILES_PATH}/hostname
    cd ~
    FILES=(".tmux.conf" ".gitconfig" ".bash_profile" ".gitignore" ".ackrc" ".inputrc" ".agignore" ".pythonrc")
    for F in ${FILES[@]}; do
        if [ -e "$F" ]; then
            rm -rf $F;
        fi
    done
    ln -s ${DOTFILES_PATH}/bash_profile .bash_profile
    ln -s ${DOTFILES_PATH}/tmuxconf .tmux.conf
    ln -s ${DOTFILES_PATH}/gitconfig .gitconfig
    ln -s ${DOTFILES_PATH}/gitignore .gitignore
    ln -s ${DOTFILES_PATH}/ackrc .ackrc
    ln -s ${DOTFILES_PATH}/inputrc .inputrc
    ln -s ${DOTFILES_PATH}/agignore .agignore
    ln -s ${DOTFILES_PATH}/pythonrc.py .pythonrc
    if [ -e ".bashrc" ]; then
        mv .bashrc .bashrc.old
    fi
fi

cd ${DOTFILES_PATH}
if [ $TARGET == '__all__' -o $TARGET == 'vim' ]; then
    if [ ! -e vimfiles ]; then
        git clone git@github.com:zwodahs/vimfiles ${DOTFILES_PATH}/vimfiles
        if [ -e .vim ]; then
            echo ".vim exist, backup to .vim.old"
            if [ ! -e .vim.old ]; then
                mv .vim .vim.old
            else
                echo ".vim.old exist"
                exit 1
            fi
        fi
	cd ~
        ln -s ${DOTFILES_PATH}/vimfiles .vim
        cd ${DOTFILES_PATH}/vimfiles
        ./setup.sh
        cd ~

        if [ -e .vimrc ]; then
            rm -rf .vimrc
        fi
        ln -s .vim/vimrc .vimrc
    fi
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
