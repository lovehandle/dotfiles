# Set pyenv root directory
export PYENV_ROOT="$HOME/.pyenv"

# Add pyenv to PATH
export PATH="$PYENV_ROOT/bin:$PATH"

# Initialize pyenv if it exists
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
else
    echo "pyenv not found. Please install pyenv first."
fi