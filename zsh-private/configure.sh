#!/usr/bin/env bash

set -eo pipefail

echo "Configuring private zsh configs..."

PRIVATE_DIR="${HOME}/.zsh-private"

if [ ! -e "${PRIVATE_DIR}" ]; then
  echo "No private zsh configs"
  exit
fi

# link custom zsh config into zsh extra configs
pushd ${EXTRA_ZSH_CONFIGS} > /dev/null
find "${PRIVATE_DIR}" -type f -name "*.zsh" -print0 | while IFS= read -r -d '' f; do
  echo "Setting up ${f}"
  ln -fs "${f}" "$( echo "${f}" | tr '/' '-' )"
done
popd > /dev/null

echo "...done"
echo
