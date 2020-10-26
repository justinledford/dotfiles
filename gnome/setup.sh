#!/bin/bash
#
# Some GNOME tweaks

set -xeu

# Extend number of workspaces to 9
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 9

# Set keyboard shortcuts to switch to workspace
for i in {1..9}; do
  dconf write \
    /org/gnome/desktop/wm/keybindings/switch-to-workspace-${i} \
    "['<Super>${i}']";
done

# Set keyboard shortcuts to move window to workspace
SYMBOLS=(
  _ exclam at numbersign dollar percent
  asciicircum ampersand asterisk parenleft
)
for i in {1..9}; do
  dconf write \
    /org/gnome/desktop/wm/keybindings/move-to-workspace-${i} \
    "['<Shift><Super>${SYMBOLS[${i}]}']";
done

# Show only windows from the current workspace in the dock
gsettings set \
  org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

# Disable touchpad when mouse connected
gsettings set \
  org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
