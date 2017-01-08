# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

bindkey -e
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
PROMPT="%{$fg[green]%}%m %{$fg[blue]%}%1~%{$reset_color%} $ "


PATH=$PATH:~/bin/scripts:~/bin:~/.gem/ruby/2.2.0/bin:~/.local/bin
export EDITOR=vim
export COWPATH=/usr/share/cows:~/.cows

source /usr/bin/virtualenvwrapper.sh
source ~/.aliases

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Base16 Shell
#BASE16_SHELL="$HOME/.dotfiles/colors/base16-deafened-mod.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# colorized man pages
#man() {
#    env \
#        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#        LESS_TERMCAP_md=$(printf "\e[1;34m") \
#        LESS_TERMCAP_me=$(printf "\e[0m") \
#        LESS_TERMCAP_se=$(printf "\e[0m") \
#        LESS_TERMCAP_so=$(printf "\e[1;40;92m") \
#        LESS_TERMCAP_ue=$(printf "\e[0m") \
#        LESS_TERMCAP_us=$(printf "\e[1;36m") \
#            man "$@"
#}

# OPAM configuration
. /home/justin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
