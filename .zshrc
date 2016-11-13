autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -Uz vcs_info

setopt completealiases appendhistory autocd extendedglob nomatch notify list_ambiguous prompt_subst
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' group-name ''
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s [%{$fg[blue]%}%b]%{$reset_color%}%m%u%c%{$reset_color%} "

precmd() {
  vcs_info
}

EDITOR=vim
PROMPT="%{$fg[green]%}%n@%M%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}✯%{$reset_color%} "
RPROMPT='${vcs_info_msg_0_}[%{$fg[yellow]%}%?%{$reset_color%}]'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias lsof='lsof -P'
alias tree='tree -C'

if [[ -r ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# Make all entries in $path unique
typeset -aU path
path=($path)
