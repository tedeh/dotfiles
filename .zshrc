autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -Uz vcs_info

setopt completealiases 
setopt appendhistory 
setopt autocd 
setopt extendedglob 
setopt nomatch 
setopt notify 
setopt list_ambiguous 
setopt prompt_subst 
setopt menu_complete
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

export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT="%{$fg[green]%}%n@%M%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}✯%{$reset_color%} "
export RPROMPT='${vcs_info_msg_0_}[%{$fg[yellow]%}%?%{$reset_color%}]'

export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

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
