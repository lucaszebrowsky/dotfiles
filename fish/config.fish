if status is-interactive
    pfetch
end

function fish_prompt
    powerline-shell --shell bare $status
end
