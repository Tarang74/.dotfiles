export ZSH="$HOME/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tarang/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tarang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tarang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tarang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Path to binaries
export PATH="$HOME/.local/bin:$PATH"

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

# Homebrew package manager
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST # Don't dump autocompletion data in home
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# Fuzzy find
source <(fzf --zsh)

# Starship prompt
eval "$(starship init zsh)"
# Smarter cd remembers long paths (Space + Tab for duplicate matches)
eval "$(zoxide init zsh)"
# Fix mistakes
eval $(thefuck --alias)

# Aliases to various modern alternatives
unalias -a # Remove all the unnecessary aliases set by zsh
alias ls="eza --git-ignore"
alias lsg="eza"
alias lsa="eza -a"
alias ll="eza --tree --level=1 --long --header --icons --git --git-ignore"
alias llg="eza --tree --level=1 --long --header --icons --git"
alias lla="eza --tree --level=1 --long --header --icons --git -a"
alias cat="bat"
alias vim="nvim"
alias cd="z"
alias rm="$HOMEBREW_PREFIX/bin/safe-rm"

# Set TERM only if inside tmux
if [[ -n "$TMUX" ]]; then
  export TERM="tmux-256color"
else
  export TERM="xterm-256color"
fi

cowsay 'it says gullible on the ceiling' | lolcat

