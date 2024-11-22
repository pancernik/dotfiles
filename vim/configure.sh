#!/usr/bin/env bash

set -euo pipefail

BASE_PATH=~/.dotfiles/vim
TPL_PATH=${BASE_PATH}/tpl
WORKDIR_PATH=~/.vim
VIMRC=~/.vimrc

echo "Configuring vim..."

rm -fR ${WORKDIR_PATH}
rm -f ${VIMRC}

# Coc installs yarn. That's a bit annoying, but as I don't use it for anything else atm, I can live with it.
rm -fR ~/.yarn

mkdir -p ${WORKDIR_PATH}

WORKDIR_PATH=$WORKDIR_PATH envsubst < $TPL_PATH/.vimrc > ${VIMRC}

echo "Installing plugins..."
curl -fLo ${WORKDIR_PATH}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall <<< "\n" # ENTER to ignore first time warnings

cp ${BASE_PATH}/tpl/coc-settings.json ${WORKDIR_PATH}

echo "...done"
echo
