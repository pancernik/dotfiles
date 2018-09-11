#!/usr/bin/env bash 

set -euo pipefail

BASE_PATH=~/.dotfiles/base16-shell
WORKDIR=${BASE_PATH}/workdir
TPL=${BASE_PATH}/tpl

echo "Configuring base16-shell..."

rm -fR $WORKDIR

git clone git@github.com:chriskempson/base16-shell.git ${WORKDIR}/base16-shell

# $EXTRA_ZSH_CONFIGS will be exported to env
BASE16_SHELL=${WORKDIR}/base16-shell DOLLAR='$' envsubst < $TPL/conf.zsh >> ${EXTRA_ZSH_CONFIGS}/base16-conf.zsh

# set my fav theme
pushd ~ > /dev/null
ln -fs ${WORKDIR}/base16-shell/scripts/base16-tomorrow-night.sh .base16_theme 
popd > /dev/null

echo "...done"
echo
