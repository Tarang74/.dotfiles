#!/bin/bash

# Terminal config
mkdir -p .config/
cp ~/.zshrc .zshrc
cp ~/.tmux.conf .tmux.conf
cp ~/.config/starship.toml .config/starship.toml

# SSH
mkdir -p .ssh/
touch .ssh/config

# Git
cp ~/.gitignore .gitignore
cp ~/.gitconfig .gitconfig
cp ~/.gitattributes .gitattributes

# Neovim
cp ~/.vimrc .vimrc
cp -r ~/.config/nvim .config/
