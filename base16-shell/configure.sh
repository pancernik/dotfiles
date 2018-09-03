#!/usr/bin/env bash 

set -euo pipefail

BASE_PATH=~/.dotfiles/base16-shell
WORKDIR=${BASE_PATH}/workdir
TPL=${BASE_PATH}/tpl

echo "Configuring base16-shell..."

rm -fR $WORKDIR

git clone git@github.com:chriskempson/base16-shell.git ${WORKDIR}/base16-shell

BASE16_SHELL=${WORKDIR}/base16-shell DOLLAR='$' envsubst < $TPL/conf.zsh >> ~/.dotfiles/zsh/workdir/.my-zshrc

# set my fav theme
pushd ~ > /dev/null
ln -fs ${WORKDIR}/base16-shell/scripts/base16-tomorrow-night.sh .base16_theme 
popd > /dev/null

echo "...done"
echo
