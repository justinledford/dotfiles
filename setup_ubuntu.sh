#!/usr/bin/bash

set -xe

# setup tmux
sudo apt -y install tmux

stow tmux
TPM_DIR=~/.tmux/plugins/tpm
[ ! -d "${TPM_DIR}" ] && git clone https://github.com/tmux-plugins/tpm ${TPM_DIR}
[ -d "/tmp/tmux-1000/default" ] && tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

./gnome/setup.sh
