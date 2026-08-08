#!/bin/bash

set -euo pipefail

RAW_ARCH=$(uname -m)
case "$RAW_ARCH" in
x86_64)
    ARCH="x86_64"
    ;;
aarch64 | arm64)
    ARCH="arm64"
    ;;
*)
    echo "Error: Unsupported architecture '$RAW_ARCH'." >&2
    exit 1
    ;;
esac

echo "detected architecture: $ARCH"

cd "$HOME"

# basics
sudo apt-get update -y
sudo apt-get install git zsh clang gcc g++ ripgrep -y

# neovim
curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$ARCH.tar.gz"
sudo rm -rf "/opt/nvim-linux-$ARCH"
sudo tar -C /opt -xzf "nvim-linux-$ARCH.tar.gz"
sudo ln -s "/opt/nvim-linux-$ARCH/bin/nvim" "/usr/bin/nvim"
git clone "https://github.com/lloydeverett/lazyvim"
mkdir -p "$HOME/.config"
ln -s "$HOME/lazyvim" "$HOME/.config/nvim"

# shell
git clone "https://github.com/lloydeverett/dotfiles"
echo "source $HOME/dotfiles/.zshrc_ext" >>"$HOME/.zshrc"
sudo usermod -s /bin/zsh "$USER"

# claude code
curl -fsSL https://claude.ai/install.sh | bash
