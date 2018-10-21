#!/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$HOME/.Scripts/:$PATH
export EDITOR="vim"

[[ -f ~/.zshrc ]] && source ~/.zshrc

[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
