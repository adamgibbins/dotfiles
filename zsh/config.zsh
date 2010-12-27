HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=2000
REPORTTIME=5
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

bindkey '[1;5D' emacs-backward-word
bindkey '[1;5C' emacs-forward-word
