# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -CF'
alias ta="tmux attach -t"
alias tls="tmux list-session"
alias ..="cd .."
alias ~="cd ~"

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '(%F{red}'$branch'%f)'
  fi
}

setopt PROMPT_SUBST
# PROMPT='[%F{green}%n%f@%F{magenta}%m%f] %F{blue}%B%~%b%f %# '
# RPROMPT='$(git_branch_name)[%F{yellow}%?%f]'

PROMPT='%F{green}%n%f@%F{magenta}%m%f:%F{blue}%B%~%b%f
\$ '
RPROMPT='$(git_branch_name)[%F{yellow}%?%f]'
