autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

setopt completealiases appendhistory autocd extendedglob nomatch notify
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' group-name ''

EDITOR=vim
PROMPT="%{$fg[green]%}%n@%M%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}%#%{$reset_color%} "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
