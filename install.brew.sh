#!/usr/bin/env bash

set -euo pipefail

echo "Removing..."
brew remove vim || true
brew remove nvim || true
brew remove zsh || true
brew remove tmux || true
brew remove curl || true
brew remove tmux-mem-cpu-load || true

echo "Installing..."
brew install vim
brew install neovim
brew install zsh
brew install tmux
brew install curl
brew install tmux-mem-cpu-load
