#!/usr/bin/env bash

cd ~
ln -s .config/zshrc .zshrc
git clone https://github.com/romkatv/powerlevel10k.git
mkdir .zsh
cd .zsh
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
wget -O - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh > omz.lib.git.zsh
wget -O - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh > omz.git.plugin.zsh
