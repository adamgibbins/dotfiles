HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=2000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt walters
