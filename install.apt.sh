#!/usr/bin/env bash

set -euo pipefail

echo "Removing..."
sudo apt --assume-yes remove vim zsh tmux curl
sudo apt --assume-yes autoremove

echo "Installing..."
sudo apt --assume-yes install vim zsh tmux curl



