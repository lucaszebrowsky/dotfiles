function fish_prompt
    string join "" (set_color green) "$USER" (set_color normal) "@" (set_color red) (prompt_hostname) (set_color normal) ":" (set_color blue) "$PWD" (set_color normal) \n "\$ "
end
