#!/usr/bin/bash

set -xe

# install stuff
sudo apt -y install \
  neovim curl git tmux build-essential cmake python3-dev stow universal-ctags \
  python3-venv python3-virtualenvwrapper \
  google-chrome-stable

# setup bash

# remove user bashrc if its the same as the system bashrc so we can just
# source the system bashrc in the stowed bashrc
diff ~/.bashrc /etc/skel/.bashrc && rm ~/.bashrc
stow bash

# setup nvim
stow nvim

## install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

## install plugins
nvim -c ":PackerInstall" -c ":qa"

# setup tmux
stow tmux
TPM_DIR=~/.tmux/plugins/tpm
[ ! -d "${TPM_DIR}" ] && git clone https://github.com/tmux-plugins/tpm ${TPM_DIR}
[ -d "/tmp/tmux-1000/default" ] && tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

./gnome/setup.sh
