# Dotfiles

This repository has my dotfiles and configuration files for various
tools I use on Ubuntu. The commands in this README have been tested on a
fresh installation of Ubuntu 24.04 and perform no destructive actions.

If you have already configured your system, ensure that you back up any
existing configuration files before running any of the commands in this
README.

## Terminal Emulator

For WSL2 users on Windows, I recommend using the Windows Terminal app
from the Microsoft Store as it is has a great UI and is very
customisable.

For Linux and macOS users, I recommend using KiTTY.

 - [Windows Terminal](https://aka.ms/terminal) ([Source](https://github.com/microsoft/terminal))
 - [KiTTY](https://www.9bis.com/kitty) ([Source](https://github.com/cyd01/KiTTY))

Note that KiTTY only works on Linux and macOS, and the Windows Terminal
does not support images in the terminal.

## Pre-requisites

Before installing any packages, ensure that your system is up to date.

```bash
sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
```

[From AskUbuntu](https://askubuntu.com/a/733439/1582514)

## Package Manager

I like using the Homebrew package manager as it organises packages
and their dependencies in a single directory.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Make sure to install `gcc` and `build-essentials` as it's required by 
many packages. I've also included `node` as we'll need it for some 
packages later.

```bash
sudo apt install build-essential
brew install gcc
brew postinstall gcc
brew install node
```

## Shell Configuration

Setup the Zsh shell and install some modern alternatives for common tools.

```bash
brew install zsh tmux bat eza zoxide neovim lua luarocks
brew install fd fzf ripgrep thefuck zip unzip git gh wget
brew install cowsay lolcat
npm i -g safe-rm
```

Set the default shell to Zsh and add it to the list of shells:

```bash
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
```

 - [Zsh](https://www.zsh.org/) ([Source](https://github.com/zsh-users/zsh))
 - tmux ([Source](https://github.com/tmux/tmux))
 - bat ([Source](https://github.com/sharkdp/bat))
 - [eza](https://eza.rocks/) ([Source](https://github.com/eza-community/eza))
 - zoxide ([Source](https://github.com/ajeetdsouza/zoxide))
 - [Neovim](https://neovim.io/) ([Source](https://github.com/neovim/neovim))
 - [lua](https://www.lua.org/) ([Source](https://github.com/lua/lua))
 - [LuaRocks](https://luarocks.org/) ([Source](https://github.com/luarocks/luarocks))
 - fd ([Source](https://github.com/sharkdp/fd))
 - [fzf](https://junegunn.github.io/fzf/) ([Source](https://github.com/junegunn/fzf/))
 - ripgrep ([Source](https://github.com/BurntSushi/ripgrep))
 - thefuck ([Source](https://github.com/nvbn/thefuck))
 - [zip](https://infozip.sourceforge.net/Zip.html)
 - [unzip](https://infozip.sourceforge.net/UnZip.html)
 - [Git](https://git-scm.com/) ([Source](https://github.com/git/git))
 - [GitHub CLI](https://cli.github.com/) ([Source](https://github.com/cli/cli))

## Programming Languages

I use Rust and Python and have already configured my `.zshrc` file.

```bash
# Rustup (Rust)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Miniconda (Python)
mkdir -p ~/miniconda3
# can also replace MacOSX-arm64 with Linux-x86_64
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
```

## Shell Customisation

Install Oh My Zsh and Starship, along with some useful plugins:

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Starship
curl -sS https://starship.rs/install.sh | sh
# Remove default zshrc
rm .zshrc .zshrc.pre-oh-my-zsh
```

Clone this repository using HTTP and copy all my configuration files:

```bash
# Work in a different directory to be safe
mkdir -p ~/downloads/
cd ~/downloads/

git clone https://www.github.com/Tarang74/.dotfiles
rm -rf .dotfiles/.git/

cp -r .dotfiles/.config/ ~/.config/
cp -r .dotfiles/.safe-rm/ ~/.safe-rm/
cp -r .dotfiles/.ssh/ ~/.ssh/

cp -r .dotfiles/.git* ~/
cp -r .dotfiles/.tmux.conf ~/
cp -r .dotfiles/.vimrc ~/
cp -r .dotfiles/.zshrc ~/

rm -rf .dotfiles/
cd ..
```

### Install Themes

 - [Catppuccin](https://github.com/catppuccin/bat) for bat:
   
   ```bash
   mkdir -p "$(bat --config-dir)/themes"
   wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
   
   # Rebuild cache
   bat cache --build
   ```

 - [Catppuccin](https://github.com/catppuccin/tmux) for tmux:
   
   ```bash
   mkdir -p ~/.config/tmux/plugins/catppuccin
   git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
   ```
 
 - [Catppuccin](https://github.com/catppuccin/neovim) for Neovim can be installed through Lazy.
 - [Catppuccin](https://github.com/catppuccin/starship) for starship has already been included in this repository.
