#!/bin/sh
export PATH=$HOME/.bin:/usr/local/bin:$HOME/.Scripts/:$PATH
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="qutebrowser"

export CONFIG="$HOME/.config/bspwm/bspwmrc"
export PANELFIFO="/tmp/panel-fifo"

export GAPFIFO="/tmp/gap-fifo"
export BARFIFO="/tmp/bar-fifo"
export WORKFIFO="/tmp/work-fifo"

[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx &>/dev/null
