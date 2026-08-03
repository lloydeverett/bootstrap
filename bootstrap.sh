#!/bin/bash

ARCH=arm64

set -euo pipefail

cd "$HOME"

# basics
sudo apt-get update -y
sudo apt-get install git zsh clang gcc g++ -y

# neovim
curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$ARCH.tar.gz"
sudo rm -rf "/opt/nvim-linux-$ARCH"
sudo tar -C /opt -xzf "nvim-linux-$ARCH.tar.gz"
sudo ln -s /opt/nvim-linux-arm64/bin/nvim /usr/bin/nvim
git clone "https://github.com/lloydeverett/lazyvim"
mkdir -p "$HOME/.config"
ln -s "$HOME/lazyvim" "$HOME/.config/nvim"

# shell
git clone "https://github.com/lloydeverett/dotfiles"
echo "source $HOME/dotfiles/.zshrc_ext" >>"$HOME/.zshrc"
sudo usermod -s /bin/zsh "$USER"

# claude code
curl -fsSL https://claude.ai/install.sh | bash
