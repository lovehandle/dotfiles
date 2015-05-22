# Define the Conda installation directory
CONDA_DIR="$HOME/miniconda3"

# Attempt to set up Conda using the preferred method
__conda_setup="$('$CONDA_DIR/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    # Fall back to conda.sh if available
    if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
        . "$CONDA_DIR/etc/profile.d/conda.sh"
    else
        # Last resort: just add Conda to the PATH
        if [ -d "$CONDA_DIR/bin" ]; then
            export PATH="$CONDA_DIR/bin:$PATH"
        else
            echo "Warning: Could not find Conda installation in $CONDA_DIR" >&2
        fi
    fi
fi
unset __conda_setup