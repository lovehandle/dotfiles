#!/bin/sh

# Check if email argument is provided
if [ -z "$1" ]; then
    echo "Error: Please provide your email address as an argument"
    echo "Usage: $0 your.email@example.com"
    exit 1
fi

echo "Generating a new SSH key for GitHub..."

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t ed25519 -C "$1" -f ~/.ssh/id_ed25519

# Create or update SSH config
touch ~/.ssh/config
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config

# Note: We don't need to start ssh-agent or add keys here
# because ssh-agent.zsh handles that on shell startup

cat ~/.ssh/id_ed25519.pub | pbcopy

echo "\nYour SSH key has been generated and copied to your clipboard!"
echo "To add it to GitHub:"
echo "1. Visit: https://github.com/settings/keys"
echo "   (or go to GitHub Settings -> SSH and GPG keys -> New SSH key)"
echo "2. Paste your key (it's already in your clipboard) and save"
echo "\nNote: Your new key will be automatically loaded next time you start your shell"

echo "\nPress Enter to open GitHub SSH settings in your browser..."
read answer
open "https://github.com/settings/keys"