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


PATH=$PATH:~/bin/scripts:~/bin:~/.gem/ruby/2.2.0/bin
export EDITOR=vim
export COWPATH=/usr/share/cows:~/.cows

source /usr/bin/virtualenvwrapper.sh
source ~/.aliases

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/colors/base16-deafened-mod.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
