#!/usr/bin/env bash

set -eo pipefail

echo "Configuring private zsh configs..."

dirs=("${HOME}/.s19-tech-dotfiles")

if [ ! "$dirs" ]; then
  exit
fi

# link custom zsh config into zsh extra configs
pushd $EXTRA_ZSH_CONFIGS > /dev/null
for d in $dirs; do
  if [ -d $d ]; then
    dname=$(basename $d | tr -d '.')
    for f in $(ls ${d}/zsh/*.zsh); do
      ln -fs $f "${dname}-$(basename $f)"
    done
  else
    echo "Directory ${d} doesn't exist"
  fi
done
popd > /dev/null

echo "...done"
echo
