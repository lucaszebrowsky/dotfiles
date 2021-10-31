if status is-interactive
    pfetch

    # Commands to run in interactive sessions can go here
end

function fish_prompt
    powerline-shell --shell bare $status
end
