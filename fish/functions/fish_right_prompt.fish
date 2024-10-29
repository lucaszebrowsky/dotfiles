function fish_right_prompt
    set -l status_color green
    set -l last_status $status
    set -g __fish_git_prompt_color red
    set -g __fish_git_prompt_color_prefix normal
    set -g __fish_git_prompt_color_suffix normal
    set -g __fish_git_prompt_describe_style branch

    if test $last_status -ne 0
        set status_color red
    end

    string join "" (fish_git_prompt) "[" (set_color $status_color) $last_status (set_color normal) "]"
end
