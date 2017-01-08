#!/bin/bash


commands=("chromium"
          "dia"
          "easytag"
          "emacs"
          "firefox"
          "gimp"
          "libreoffice"
          "mpdcover"
          "spotify"
          "teamviewer"
          "thunderbird"
          "thunar"
          "virtualbox"
          "xclock"
          "zathura")

while read line; do
    buffer=""
    for c in ${commands[@]}; do
        if [[ $c == *$line* ]]
        then
            buffer="$buffer {$c|$c}"
        fi
    done
    echo "$buffer"
done

