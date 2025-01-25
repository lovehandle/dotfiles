# SSH-AGENT
# This script manages the SSH agent process, which handles SSH keys and authentication.
# It ensures a single SSH agent is running and loads necessary keys automatically.

# Path to store SSH agent environment variables
SSH_ENV="${HOME}/.ssh/environment"

# Function to start a new SSH agent process
# Returns:
#   0 on success
#   1 on failure (agent start or key addition fails)
function start_agent() {
    echo "Initializing new SSH agent..."
    
    # Start SSH agent and capture environment variables
    if ! /usr/bin/ssh-agent > "${SSH_ENV}.tmp"; then
        echo "Failed to start SSH agent" >&2
        return 1
    fi
    
    # Process the environment file:
    # - Remove echo statements (they're not needed when sourcing)
    # - Store in final location
    sed 's/^echo/#echo/' "${SSH_ENV}.tmp" > "${SSH_ENV}"
    rm -f "${SSH_ENV}.tmp"
    
    # Secure the environment file (read/write for owner only)
    chmod 600 "${SSH_ENV}"
    
    # Load the agent environment variables
    . "${SSH_ENV}" > /dev/null
    
    # Add SSH keys from the default location (~/.ssh/)
    if ! /usr/bin/ssh-add; then
        echo "Failed to add SSH keys" >&2
        return 1
    fi
    
    echo "SSH agent started successfully"
}

# Verify ssh-agent is installed on the system
if ! command -v /usr/bin/ssh-agent >/dev/null 2>&1; then
    echo "ssh-agent not found" >&2
    return 1
fi

# Main logic:
# 1. Check if environment file exists
# 2. If it exists, verify the agent is still running
# 3. Start new agent if needed
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    # Verify SSH agent is still running by checking its PID
    # Uses ps to check if the process exists and is actually ssh-agent
    ps -p "${SSH_AGENT_PID}" 2>/dev/null | grep -q ssh-agent || {
        start_agent
    }
else
    start_agent
fi
