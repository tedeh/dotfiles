PATH=$PATH:/home/tedeh/opt/node/0.4/bin
export PATH

color_prompt=yes
force_color_prompt=yes
alias tmux="tmux -2"

function tmux-refresh() {   
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=`tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2`
      if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then 
        SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK  
      fi
  fi
}
