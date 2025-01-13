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

path+=("$HOME/.local/pip-bins" "$HOME/.local/share/nvim/mason/bin" "$HOME/.cargo/bin")
source ~/.config/zsh/aliases.zsh
eval "$(zoxide init --no-aliases zsh)"
eval "$(starship init zsh)"
export CC=gcc
export CFLAGS="-Wall -Wextra -Wshadow -Wconversion -Wformat=2 -Winline -Wunsafe-loop-optimizations -Wundef\
    -Wpointer-arith -Wpedantic -Wstrict-aliasing -Wcast-align -march=native\
    -mtune=generic -O2"
export EDITOR="/usr/bin/nvim"
export FZF_DEFAULT_OPTS="--bind=alt-n:down,alt-p:up"
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

source ~/.config/zsh/scripts/autostart-ssh.zsh
