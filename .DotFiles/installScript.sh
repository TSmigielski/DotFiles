#!/usr/bin/env bash

cd ~
ln -s .config/zsh/zshrc .zshrc
mkdir .zsh
cd .zsh
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete
git clone https://github.com/jeffreytse/zsh-vi-mode.git
wget -O - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh > omz.lib.git.zsh
wget -O - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh > omz.git.plugin.zsh
