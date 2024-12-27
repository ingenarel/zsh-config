# The following lines were added by compinstall

# zstyle ':completion:*' completer _complete _ignored _correct _approximate
# zstyle :compinstall filename '/home/ingenarel/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

source ~/.config/zsh/plugins/init.zsh

eval "$(zoxide init --no-aliases zsh)"
alias z="__zoxide_z"
alias zf="__zoxide_zi"
alias btop="sudo btop"
eval "$(starship init zsh)"
source <(fzf --zsh)
path+=("$HOME/.local/pip-bins" "$HOME/.local/share/nvim/mason/bin")
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Reuse or start a single ssh-agent
# chatgpt written code starts
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
