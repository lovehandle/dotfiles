#compdef c

# Completion script for the 'c' command
# Requires $PROJECTS to be set to the base directory for code projects

# Check if CODE is set and valid
if [[ -z "$PROJECTS" ]]; then
    _message "CODE is not set"
    return 1
elif [[ ! -d "$PROJECTS" ]]; then
    _message "CODE directory does not exist"
    return 1
fi

# Complete directory names under CODE
_files -W $PROJECTS -/