# Alias
alias clr="clear"
alias vim="nvim"

# Env Variables
set -u fish_greeting
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
# set -Ux OBS_USE_EGL 1
set -Ux MOZ_ENABLE_WAYLAND 1


if status is-interactive
	neofetch
end


for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end
