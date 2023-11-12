#!/bin/bash

set -xe

# Extend number of workspaces and set keyboard shortcuts
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-${i}" \
    "['<Super>${i}']"
done

SYMBOLS=(
  _ exclam at numbersign dollar percent
  asciicircum ampersand asterisk parenleft
)
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-${i}" \
    "['<Shift><Super>${SYMBOLS[${i}]}']"
done

# Remove shortcuts from dash to dock which conflict with the above shortcuts
for i in {1..9}; do
  gsettings set org.gnome.shell.extensions.dash-to-dock "app-hotkey-${i}" "['']"
done

# Remove annoying animation when switching workspaces
gsettings set org.gnome.desktop.interface enable-animations false

# Show only windows from the current workspace in the dock
gsettings set \
  org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

# Set dock favorites
gsettings set \
  org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'google-chrome.desktop']"

# Misc shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>space']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>j']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# Configure terminal profile
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
gsettings set \
  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
  font 'Ubuntu Mono 11'

# set to "Tango light"
gsettings set \
  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
  use-theme-colors false
gsettings set \
  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
  foreground-color 'rgb(46,52,54)'
gsettings set \
  org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ \
  background-color 'rgb(238,238,236)'
