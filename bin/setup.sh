#!/bin/zsh -e

# Helper functions
print_step() {
    echo "==> $1"
}

backup_if_exists() {
    if [[ -e "$1" && ! -L "$1" ]]; then
        mv "$1" "$1.backup"
        echo "Backed up $1 to $1.backup"
    fi
}

# Set up base directory
export DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export IS_MACOS=$(uname -s | grep -q "Darwin" && echo "1" || echo "")

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_step "Homebrew already installed"
fi

# Install Homebrew packages
print_step "Installing Homebrew packages..."
brew tap homebrew/bundle
brew bundle --file ./Brewfile

print_step "Setting up shell configuration..."
export ZSH="$HOME/.zsh"

# Shell configuration
if [[ ! -e $ZSH ]]; then
    ln -fs "$DIR/zsh" $ZSH
fi

for file in "zshenv" "zprofile" "zshrc"; do
    backup_if_exists "$HOME/.$file"
    ln -fs "$DIR/$file" "$HOME/.$file"
done

# Install fzf key bindings and completion
if command -v fzf >/dev/null 2>&1; then
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
fi

# Vim configuration
print_step "Setting up Vim configuration..."

if ! command -v vim >/dev/null 2>&1; then
    echo "Warning: vim is not installed"
else
    if [[ ! -e $VIM/autoload/plug.vim ]]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    backup_if_exists "$HOME/.vimrc"
    backup_if_exists "$HOME/.vimrc.plugs"
    ln -fs "$DIR/vimrc" "$HOME/.vimrc"
    ln -fs "$DIR/vimrc.plugs" "$HOME/.vimrc.plugs"

    echo "Installing Vim plugins..."
    vim +PlugInstall +qall
fi

# Git configuration
print_step "Setting up Git configuration..."
backup_if_exists "$HOME/.gitignore"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.gitattributes"
ln -fs "$DIR/gitignore" "$HOME/.gitignore"
ln -fs "$DIR/gitconfig" "$HOME/.gitconfig"
ln -fs "$DIR/gitattributes" "$HOME/.gitattributes"

# Irssi configuration
print_step "Setting up Irssi configuration..."
export IRSSI="$HOME/.irssi"
if [[ ! -e $IRSSI ]]; then
    ln -fs "$DIR/irssi" $IRSSI
fi

# Tmux configuration
print_step "Setting up Tmux configuration..."
backup_if_exists "$HOME/.tmux.conf"
ln -fs "$DIR/tmux.conf" "$HOME/.tmux.conf"
