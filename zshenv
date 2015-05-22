# Basic environment setup
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor configuration
export VISUAL=vim
export EDITOR="$VISUAL"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Path configuration
export PATH="./bin:$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH"

# Directory shortcuts
export PROJECTS="$HOME/Developer"
export DOTFILES="$PROJECTS/dotfiles"
export ZSH="$HOME/.zsh"

# Tool-specific environment variables
export CLICOLOR=1
export GREP_OPTIONS="--color=auto"
export LESS="-F -g -i -M -R -S -w -X -z-4"

# Load additional environment variables
if [ -d "$ZSH/env" ] && [ -n "$(ls $ZSH/env 2>/dev/null)" ]; then
  for env in $ZSH/env/*; do
    source $env
  done
fi
