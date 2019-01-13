#!/bin/sh
export PATH=$HOME/.bin:/usr/local/bin:$HOME/.Scripts/:$PATH
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="qutebrowser"

[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx &>/dev/null
