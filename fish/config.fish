# Alias
alias clr="clear"
alias ..="cd .."
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias grep='grep --color=auto'

# Env Variables
set -U fish_greeting
set -Ux GTK_USE_PORTAL 1

if type -q helix
	alias hx="helix"
end

if status is-interactive
   neofetch    
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
