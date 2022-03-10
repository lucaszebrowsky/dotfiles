if status is-interactive
    pfetch
    cowsay -e oO -T U Welcome back, Master! :P
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    powerline-shell --shell bare $status
end

# if Flatpaks are installed and Fish is Default Shell
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end
