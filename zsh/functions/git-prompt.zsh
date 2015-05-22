# Checks if the current git repository has uncommitted changes
# Returns: " ⚡︎" if there are uncommitted changes, empty string otherwise
git_prompt_dirty() {
  local dirty=$(git diff-index --quiet HEAD -- 2> /dev/null || echo "dirty")
  
  # If $dirty is not empty (changes exist), output the lightning bolt symbol
  if [[ -n $dirty ]]; then
    echo " ⚡︎"
  fi
}

# Generates a formatted string showing the current git branch and dirty state
# Returns: " [ branch_name⚡︎ ]" if in a git repo, empty string otherwise
# The branch name is colored red and the dirty indicator (if present) is yellow
git_prompt_info() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  
  # If $current_branch is not empty (we're in a git repo), format and output the prompt
  if [[ -n $current_branch ]]; then
    echo " [ %F{red}$current_branch%f%F{yellow}$(git_prompt_dirty)%f ]"
  fi
}