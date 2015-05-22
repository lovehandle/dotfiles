# Environment variables
export CLICOLOR=1

# History file location and size settings
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Directory stack size
DIRSTACKSIZE=5

# Initialize homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Initialize language version managers
# Only initialize in login shell to avoid slowdown

# Python via pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

# Node via nvm
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use # This loads nvm
fi

# Ruby via rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Conda initialization
if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniforge3/etc/profile.d/conda.sh"
fi

# Set default browser
if [ -n "$DISPLAY" ]; then
  export BROWSER=arc
fi

# Set locale
export LANG=${LANG:-en_US.UTF-8}
export LANGUAGE=${LANGUAGE:-en_US.UTF-8}
export LC_ALL=${LC_ALL:-en_US.UTF-8}