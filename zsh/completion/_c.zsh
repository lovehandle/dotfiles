#compdef c

# Completion script for the 'c' command
# Requires $PROJECTS to be set to the base directory for code projects

# Check if PROJECTS is set and valid
if [[ -z "$PROJECTS" ]]; then
    _message "PROJECTS is not set"
    return 1
elif [[ ! -d "$PROJECTS" ]]; then
    _message "PROJECTS directory does not exist"
    return 1
fi

# Complete directory names under PROJECTS
_files -W $PROJECTS -/