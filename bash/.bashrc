# ~/.bashrc: executed by bash(1) for non-login shells.

# Source system default (Ubuntu location)
. /etc/skel/.bashrc

# Environment variables
export VISUAL=vim
export EDITOR="$VISUAL"

export VERILATOR_ROOT=/home/justin/stuff/fpga/verilator
export PATH="${VERILATOR_ROOT}/bin:~/.local/bin:~/bin:${PATH}"


source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
