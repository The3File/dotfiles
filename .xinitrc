#!/bin/sh

xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/OTF

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

exec xsetroot -cursor_name left_ptr &
exec setxkbmap -layout dk -variant nodeadkeys -option caps:escape &
exec greenclip daemon &
exec /usr/lib/kdeconnectd &
exec xbanish -i Mod1 -i Mod4 &
exec compton --dbus -b &
exec networkd-dispatcher &
exec wal -Rtn &
exec feh --bg-fill $HOME/.config/wall.png &
exec dunst &
exec acpid_events &
exec sxhkd &
exec bspwm
