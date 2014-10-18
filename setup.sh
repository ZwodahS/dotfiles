#!/bin/bash

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

if [ -e .vimfiles ]; then
    rm -rf .vimfiles
fi
git clone git@github.com:zwodahs/vimfiles .vimfiles
ln -s .vimfiles .vim
cd .vim
./addlinks.sh
cd ~

if [ -e .vimrc ]; then
    rm -rf .vimrc
fi
ln -s .vim/vimrc .vimrc
