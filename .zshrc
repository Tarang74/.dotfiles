export ZSH="$HOME/.oh-my-zsh"

# Oh-my-zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh
# Fuzzy find
source <(fzf --zsh)

# Path to binaries
export PATH="$HOME/.platformio/penv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Aliases to various modern alternatives
alias ls="eza"
alias ll="eza --tree --level=1 --long --header --icons --git --git-ignore"
alias cat="bat"
alias vim="nvim"
alias cd="z"
alias rm="rm -i"

# Catppuccin mocha theme
export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4 \
--layout=reverse \
--border \
--preview 'bat --style=numbers --color=always --line-range :500 {} 2>/dev/null || cat {}' \
--preview-window=right:50%:wrap \
--height=50% \
--tmux 100%,50%"

# Starship prompt
eval "$(starship init zsh)"
# Smarter cd remembers long paths (Space + Tab for duplicate matches)
eval "$(zoxide init zsh)"
# Homebrew package manager
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Fix mistakes
eval $(thefuck --alias)

# An old joke
clear; cowsay "it says gullible on the ceiling" | lolcat
