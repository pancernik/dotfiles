#!/usr/bin/env bash

set -euo pipefail

BASE_PATH=~/.dotfiles/base16-shell
WORKDIR=~/.config/base16-shell
TPL=${BASE_PATH}/tpl

echo "Configuring base16-shell..."

rm -fR $WORKDIR
git clone git@github.com:tinted-theming/base16-shell.git ${WORKDIR}

rm -f ${EXTRA_ZSH_CONFIGS}/base16-conf.zsh
# $EXTRA_ZSH_CONFIGS will be exported to env
cp $TPL/conf.zsh ${EXTRA_ZSH_CONFIGS}/base16-shell.zsh

echo "...done"
echo
