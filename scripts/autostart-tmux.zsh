if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux has-session -t ${USER} 2>/dev/null
    if [ $? != 0 ]; then
        tmux new-session -d -s ${USER} 'hyfetch; exec $SHELL'
    fi
    exec tmux attach-session -t ${USER} >/dev/null 2>&1
fi
