#!/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$HOME/.Scripts/:$PATH
export VISUAL=nvim
export EDITOR=nvim

xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/OTF

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#exec wal -Rn
exec i3
#exec startdwm
