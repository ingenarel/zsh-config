# The following lines were added by compinstall

# zstyle ':completion:*' completer _complete _ignored _correct _approximate
# zstyle :compinstall filename '/home/ingenarel/.zshrc'

autoload -U compinit
compinit
_comp_options+=(globdots)
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
eval $(thefuck --alias f)
path+=("$HOME/.local/pip-bins" "$HOME/.local/share/nvim/mason/bin")
export EDITOR="/usr/bin/nvim"
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

source ~/.config/zsh/scripts/autostart-ssh.zsh
source ~/.config/zsh/scripts/autostart-tmux.zsh
