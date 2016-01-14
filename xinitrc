#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
sh ~/.monitors.sh
sh ~/.fehbg
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

launch_cwm() {
    compton &
    exec cwm
}


session=${1:-gnome}

case $session in
    cwm         ) launch_cwm;;
	i3		    ) exec i3;;
	gnome		) exec gnome-session;;
    awesome     ) exec awesome;;
	*) exec $1;;
esac

xset m 5 5
setxkbmap -option compose:ralt
