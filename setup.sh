#!/usr/bin/bash

set -e

# install stuff
sudo apt -y install curl git tmux build-essential cmake python3-dev

#setup bash

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
pushd ~/.vim/plugged/YouCompleteMe
#python3 install.py --clangd-completer
popd

# setup tmux
stow tmux
TPM_DIR=~/.tmux/plugins/tpm
[ ! -d "${TPM_DIR}" ] && git clone https://github.com/tmux-plugins/tpm ${TPM_DIR}
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
