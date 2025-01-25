if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
elif [ -f /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh
elif [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

# Configure fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
