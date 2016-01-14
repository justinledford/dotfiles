# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/justin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# Prompts
autoload -U promptinit
promptinit
autoload -U colors && colors
autoload -U prompt_special_chars
prompt_special_chars

PROMPT="%{$fg[blue]%}%1~%{$reset_color%} $ "

# Aliases
alias ls='ls --color=auto'
alias sync-sd-test='rsync -nrvt --stats --modify-window=1 --exclude={"*.jpg","*.png"} --delete /mnt/WD3000ext4/Music/Library/ /mnt/sd/MUSIC'
alias sync-sd='rsync -rvt --modify-window=1 --exclude={"*.jpg","*.png"} --delete /mnt/WD3000ext4/Music/Library/ /mnt/sd/MUSIC'
alias backup='sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} --delete /* /mnt/exthd/ArchBackup/'
alias sync-mpd-test='rsync -nrvt --delete --exclude={"*.jpg","*.png"} /mnt/WD3000ext4/Music/Library/ root@voyage:/media/usb0/Music/Library/'
alias sync-mpd='rsync -rvt --delete --exclude={"*.jpg","*.png"} /mnt/WD3000ext4/Music/Library/ root@voyage:/media/usb0/Music/Library'
alias backup-music='rsync -rvt --delete /mnt/WD3000ext4/Music/Library/ /mnt/exthd/MusicLibraryBackup/'
alias music='ncmpcpp -h 192.168.1.108'
alias tree='tree -C'
alias watch-dmesg='watch "dmesg -T | tail -n 10"'
alias info="info --vi-keys"
alias irc="ssh -t capybara 'tmux a'"
alias sync-mpd-playlists='rsync -v ~/Music/Playlists/mpd/ voyage:"/var/lib/mpd/playlists/"'
alias sync-sd-playlists='rsync -v ~/Music/Playlists/mpd/ /mnt/sd/MUSIC/Playlists/'

export EDITOR=vim

source /usr/bin/virtualenvwrapper.sh

PATH=$PATH:~/bin/scripts:~/bin:~/.gem/ruby/2.2.0/bin

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-deafened-mod.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
