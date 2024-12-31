# chatgpt written code starts
# Reuse or start a single ssh-agent
SSH_ENV="$HOME/.ssh/ssh-agent.env"
# Function to start ssh-agent
start_ssh_agent() {
    eval "$(ssh-agent -s)" > /dev/null
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$SSH_ENV"
    echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> "$SSH_ENV"
    chmod 600 "$SSH_ENV"
}

# Load SSH agent settings if available
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
    # Check if the agent is still running
    if ! kill -0 "$SSH_AGENT_PID" > /dev/null 2>&1; then
        start_ssh_agent
    fi
else
    start_ssh_agent
fi
# chatgpt written code ends
