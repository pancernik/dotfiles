#!/usr/bin/env bash 

set -euo pipefail

BASE_PATH=~/.dotfiles/tmux
WORKDIR=${BASE_PATH}/workdir
TPL=${BASE_PATH}/tpl

echo "Configuring tmux..."

rm -fR ${WORKDIR}
rm -f ~/.tmux.conf

TPM=${WORKDIR}/tpm-plugins
git clone https://github.com/tmux-plugins/tpm ${TPM}/tpm

TPM=${TPM} envsubst < $TPL/.tmux.conf >> ~/.tmux.conf
${TPM}/tpm/scripts/install_plugins.sh

echo "...done"
echo
