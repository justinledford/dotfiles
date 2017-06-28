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


# Prompts
autoload -U promptinit
promptinit
autoload -U colors && colors
autoload -U prompt_special_chars
prompt_special_chars
PROMPT="%{$fg[green]%}%m %{$fg[blue]%}%1~%{$reset_color%} $ "

export PATH=$PATH:~/bin:~/.local/bin
export EDITOR=vim

# Use npm global without sudo
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

source ~/.aliases
source ~/.functions

source ~/.local/bin/virtualenvwrapper_lazy.sh

# Edit commands with vim with Ctrl-X Ctrl-E
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
