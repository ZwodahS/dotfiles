#!/bin/bash
FDR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$FDR/common.sh"

pushd ~/.vim > /dev/null
vim_commit=$(git rev-parse HEAD | cut -c1-10 | tr -d '\n')
popd > /dev/null

pushd ~/.dotfiles > /dev/null
dotfile_commit=$(git rev-parse HEAD | cut -c1-10 | tr -d '\n')
popd > /dev/null

echo -n "[d:#[fg=colour11]$dotfile_commit#[fg=default]] [v:#[fg=colour11]$vim_commit#[fg=default]] $(_format_time) "
