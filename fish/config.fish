# Alias
alias clr="clear"
alias ..="cd .."
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias grep="grep --color=auto"
alias t="tree ."
alias uptime="uptime -p"

# Git
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"

# Env Variables
set -U fish_greeting
set -Ux GTK_USE_PORTAL 1

if status is-interactive
    # if test $TERM = xterm-kitty
    #     alias ssh="kitten ssh"
    # end

    # Use Helix as default terminal editor
    if type -q hx
        set -Ux EDITOR $(which hx)
    end

end
