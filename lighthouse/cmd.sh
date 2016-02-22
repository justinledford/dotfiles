#!/bin/bash


commands=("chromium"
          "easytag"
          "firefox"
          "gimp"
          "libreoffice"
          "mpdcover"
          "teamviewer"
          "thunderbird"
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

