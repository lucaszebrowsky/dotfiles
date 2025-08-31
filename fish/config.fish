# Alias
alias clr="clear"
alias ..="cd .."
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias grep="grep --color=auto"
alias t="tree ."
alias uptime="uptime -p"

# Tmux
alias ta="tmux attach -t"
alias tls="tmux list-session"

# Git
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias ga="git add"

# ESP-IDF
alias get_idf=". ~/.esp/esp-idf/export.fish"

# Env Variables
set -U fish_greeting
set -Ux GTK_USE_PORTAL 1

# Use OpenSSH's build-in ssh-agent
# Enable via: systemctl enable --user --now ssh-agent.socket
if test -n "$XDG_RUNTIME_DIR" -a (uname) = Linux
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

if status is-interactive
    # Use Helix as default terminal editor
    if type -q hx
        set -Ux EDITOR $(which hx)
    end
end
