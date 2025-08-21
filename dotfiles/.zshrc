#!/bin/zsh
# by Arjun Bohara

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="agnoster"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    command-not-found
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='nvim'

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias ga='git add'
alias gd='git diff'
alias gl='git log --oneline'
alias ..='cd ..'
alias ...='cd ../..'
alias clear='clear && echo "✨ Terminal cleared - by Arjun Bohara"'
alias c='clear'
alias vim='nvim'
alias cat='bat'
alias ls='exa --icons'

# Custom functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Starship prompt (if installed)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Welcome message
echo "🌟 Zsh configuration loaded - by Arjun Bohara"
