# Dotfiles

My personal dotfiles for setting up a new development environment on macOS.

## Features

- Zsh configuration with sensible defaults and plugins
- Vim configuration with plugins and key mappings
- Git configuration and global gitignore
- Tmux configuration
- Homebrew packages and casks
- Automated setup script

## Installation

1. Clone this repository:
```bash
git clone https://github.com/lovehandle/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the setup script:
```bash
./bin/setup.sh
```

## Configuration Details

### Zsh
- Custom aliases and functions in `~/.zshrc`
- Installed plugins:
  - git
  - syntax-highlighting
  - autosuggestions
  - z (directory jumping)

### Vim
- Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- Key features:
  - File explorer (NERDTree)
  - Fuzzy finder (fzf)
  - Git integration (fugitive)
  - Status line (airline)
- Custom keybindings defined in `~/.vimrc`

### Git
- Global `.gitignore` for common files
- Useful aliases and configuration
- GPG signing setup

### Tmux
- Custom prefix key: `Ctrl+a`
- Mouse mode enabled
- Status bar customization
- Split panes with intuitive shortcuts

## Homebrew Packages

Core utilities and development tools installed via Homebrew:
- git
- vim
- tmux
- fzf
- ripgrep
- node
- python
- docker

## Customization

To customize the configurations:

1. Fork this repository
2. Modify the dotfiles to your preferences
3. Update the `setup.sh` script if needed
4. Update this README to reflect your changes

## Updating

To update the dotfiles:

```bash
cd ~/.dotfiles
git pull
./bin/setup.sh
```

## Troubleshooting

If you encounter any issues:

1. Check the logs in `~/.dotfiles/logs`
2. Ensure all prerequisites are installed
3. Open an issue on GitHub

## License

MIT License - feel free to use and modify as needed.
