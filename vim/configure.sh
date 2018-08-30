#!/usr/bin/env bash

set -euo pipefail

BASE_PATH=~/.dotfiles/vim
WORKDIR_PATH=$BASE_PATH/workdir
TPL_PATH=$BASE_PATH/tpl
VUNDLE_PATH=$WORKDIR_PATH/.vundle

echo "Configuring vim..."

rm -fR $WORKDIR_PATH
 rm -f ~/.vimrc

mkdir -p $WORKDIR_PATH
mkdir -p $VUNDLE_PATH

git clone git@github.com:VundleVim/Vundle.vim.git $VUNDLE_PATH/Vundle.vim
VUNDLE_PATH=$VUNDLE_PATH envsubst < $TPL_PATH/.vimrc > ~/.vimrc
vim +PluginInstall +qall <<< "\n" # ENTER to ignore first time warnings 

echo "...done"
echo
