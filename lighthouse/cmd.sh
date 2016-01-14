#!/bin/bash


commands=("chromium"
          "firefox"
          "thunderbird"
          "virtualbox"
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

