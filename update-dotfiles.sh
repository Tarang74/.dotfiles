#!/bin/bash

# Terminal config
cp ~/.zshrc .zshrc
cp ~/.tmux.conf .tmux.conf
cp ~/.config/starship.toml .config/starship.toml

# Git
cp ~/.gitignore .gitignore
cp ~/.gitconfig .gitconfig
cp ~/.gitattributes .gitattributes

# Neovim
cp ~/.vimrc .vimrc
cp -r ~/.config/nvim .config/

# Safe-rm
cp ~/.safe-rm/.gitignore .safe-rm/.gitignore
