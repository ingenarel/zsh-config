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
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
# fastfetch
