# Alias
alias clr="clear"
# alias vim="nvim"
# alias ssh="kitty +kitten ssh"
# alias hx="helix"

# Workaround for using sudo + vim alias:
# create a symlink called "vim" to "nvim"
# ln -s /usr/bin/nvim /usr/bin/vim

# Env Variables
set -u fish_greeting
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
set -Ux MOZ_ENABLE_WAYLAND 1

if status is-interactive
    if not set -q TMUX
        set -g TMUX tmux new-session -d -s main
        eval $TMUX
        tmux attach-session -d -t main
    end
    neofetch    
end

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
