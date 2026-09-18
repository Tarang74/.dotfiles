# .dotfiles

This repository holds all my dotfiles and configurations for the tools I
use on macOS. My configuration files are managed with
[GNU Stow](https://www.gnu.org/software/stow/) so each configuration is
symlinked into `$HOME`.

The commands below do not perform destructive actions, but if you
already have configs in place, back them up before symlinking, or use
`stow --adopt` (see below).

## Terminal Emulator

I use [KiTTY](https://www.9bis.com/kitty) ([Source](https://github.com/cyd01/KiTTY)).

## Pre-requisites

Install the Xcode Command Line Tools:

```bash
xcode-select --install
```

## Package Manager

Homebrew keeps packages and their dependencies in a single directory.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Make sure to follow the post-install hint to add `brew shellenv` to
your shell profile so `brew` is on `$PATH`.

I'll include `node` since some later tools need it.

```bash
brew install node
```

## Shell Configuration

Install stow, Zsh, and modern alternatives for common tools:

```bash
brew install stow zsh tmux bat eza zoxide neovim lua luarocks
brew install fd fzf ripgrep thefuck zip unzip git gh wget
brew install cowsay lolcat
npm i -g safe-rm
```

Set Zsh as the default shell if it isn't already:

```bash
chsh -s "$(command -v zsh)"
```

- [Stow](https://www.gnu.org/software/stow/) ([Source](https://git.savannah.gnu.org/cgit/stow.git))
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

I use Rust and Python and have already configured my `.zshrc` file for
both.

```bash
# Rustup (Rust)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Miniconda (Python) — Apple Silicon
mkdir -p ~/miniconda3
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
# Remove the default .zshrc Oh My Zsh just installed so stow can symlink mine
rm -f ~/.zshrc ~/.zshrc.pre-oh-my-zsh
```

## Install my dotfiles

Clone this repo into `~/.dotfiles`, then let stow symlink everything
into `$HOME`:

```bash
git clone https://github.com/Tarang74/.dotfiles ~/.dotfiles
cd ~/.dotfiles
stow zsh tmux vim nvim git starship safe-rm
```

Each named argument is a package directory in this repo. Stow mirrors
its contents into `$HOME`.

## Install Themes

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
