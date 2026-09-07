if [[ "$XDG_VTNR" == "1" && -z "$TMUX" && "$TTY" = "/dev/tty1" ]]; then
    startplasma-wayland
fi
