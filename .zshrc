autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

setopt completealiases appendhistory autocd extendedglob nomatch notify list_ambiguous
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward

zstyle ':completion:*' menu select

EDITOR=vim
PROMPT="%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}%#%{$reset_color%} "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
