#!/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$HOME/.Scripts/:$PATH
export EDITOR="vim"
export BROWSER="qutebrowser"

[[ -f ~/.zshrc ]] && source ~/.zshrc
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
#[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
