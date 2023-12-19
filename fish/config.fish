# Alias
alias clr="clear"
alias ..="cd .."

# Env Variables
set -u fish_greeting
set -Ux GTK_USE_PORTAL 1

if status is-interactive
    if not set -q TMUX
        set -g TMUX tmux new-session -d -s main
        eval $TMUX
        tmux attach-session -d -t main
    end
    neofetch    
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
