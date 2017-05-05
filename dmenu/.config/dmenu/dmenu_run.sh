#!/bin/bash

COMMANDS=~/dotfiles/dmenu/.config/dmenu/commands.txt

dmenu -nf \#262626 -nb \#ccc5c0 -sb \#335266 -fn LuxiMono:size=9 < $COMMANDS |\
    $SHELL &
