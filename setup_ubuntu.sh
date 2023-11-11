#!/usr/bin/bash

set -e

# install stuff
sudo apt -y install \
  vim curl git tmux build-essential cmake python3-dev stow universal-ctags \
  google-chrome-stable

# setup bash

# remove user bashrc if its the same as the system bashrc so we can just
# source the system bashrc in the stowed bashrc
diff ~/.bashrc /etc/skel/.bashrc && rm ~/.bashrc
stow bash

# setup vim
stow vim
mkdir -p ~/.vim/undo

## install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## install plugins
vim -c ":PlugInstall" -c ":qa"

# setup tmux
stow tmux
TPM_DIR=~/.tmux/plugins/tpm
[ ! -d "${TPM_DIR}" ] && git clone https://github.com/tmux-plugins/tpm ${TPM_DIR}
[ -d "/tmp/tmux-1000/default" ] && tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
