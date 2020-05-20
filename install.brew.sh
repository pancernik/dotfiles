#!/usr/bin/env bash

set -euo pipefail

echo "Removing..."
brew remove vim
brew remove nvim
brew remove zsh
brew remove tmux
brew remove curl

echo "Installing..."
brew install vim
brew install neovim
brew install zsh
brew install tmux
brew install curl
