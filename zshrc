# Set ZSH directory
export ZSH="$HOME/.zsh"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY       # Write format
setopt INC_APPEND_HISTORY    # Write after each command
setopt SHARE_HISTORY         # Share between sessions
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY           # Don't execute immediately upon history expansion

# Directory navigation
setopt AUTO_CD              # If command is directory, cd into it
setopt AUTO_PUSHD          # Push old directory onto stack
setopt PUSHD_IGNORE_DUPS   # Don't push duplicates
setopt PUSHD_MINUS         # Exchange meaning of +/-
setopt PUSHD_SILENT        # Don't print directory stack
DIRSTACKSIZE=20

# Completion system
autoload -Uz compinit
compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}     # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # Automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'                # Speed up path completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
_comp_options+=(globdots)                                 # Include hidden files

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Better vi mode with additional key bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^b' backward-char
bindkey '^k' kill-line
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^u' kill-whole-line
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Load functions
for function in $ZSH/functions/*; do
  source $function
done

setopt promptsubst
export PS1='%2~%{$reset_color%}$(git_prompt_info) »%b '

# Load completions
fpath=($ZSH/completion $fpath)

# Load configs (including modern shell features)
for config in $ZSH/configs/*; do
  source $config
done

# Load aliases
for alias in $ZSH/aliases/*; do
  source $alias
done

# Load plugins
for plugin in $ZSH/plugins/*; do
  source $plugin
done

# Load local config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local