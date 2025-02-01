if [[ -r ~/.zshrc_head.local ]]; then
  source ~/.zshrc_head.local
fi
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -Uz compinit && compinit
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
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:ssh:*' hosts ${(s: :)${(f)"$(grep '^Host ' ~/.ssh/config | awk '{print $2}')"}}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$fg[blue]%}[%b]%{$reset_color%}%m%u%c%{$reset_color%} "

precmd() {
  vcs_info
}

export EDITOR=vim
export GIT_EDITOR=vim

# old stuff
#export PROMPT="%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[yellow]%}✯%{$reset_color%} "
#export RPROMPT='${vcs_info_msg_0_}[%{$fg[yellow]%}%?%{$reset_color%}]'

# see https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
export PROMPT="%{$fg[yellow]%}[%D{%F} %T] %{$fg[red]%}%n %{$fg[blue]%}%2d%{$reset_color%} %{$fg[cyan]%}λ%{$reset_color%} "
export RPROMPT='${vcs_info_msg_0_}%{$fg[green]%}%m%{$reset_color%}'

export HISTFILE=~/.histfile
export HISTSIZE=2000
export SAVEHIST=2000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias lsof='lsof -P'
alias tree='tree -C'

# this alias opens vim tabs with all ack search results, automatically searching in vim
# $1 = ack search string
# $2 = (optional) directory, defaults to cwd
vick () {
  if [ "$2" != "" ]
  then
    vim -c "/$1" -p `ack -l $1 $2`
  else
    vim -c "/$1" -p `ack -l $1 .`
  fi
}

# same as vick but opens nvim instead
nvick () {
  if [ "$2" != "" ]
  then
    nvim -c "/$1" -p `ack -l $1 $2`
  else
    nvim -c "/$1" -p `ack -l $1 .`
  fi
}

# alias commits everything in v
gitca () {
  git commit -am $1
}

if [[ -r ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# Make all entries in $path unique
typeset -aU path
path=($path)

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
