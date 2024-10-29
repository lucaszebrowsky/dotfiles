function fish_prompt
    string join "" (set_color green) "$USER" (set_color normal) "@" (set_color red) (prompt_hostname) (set_color normal) ":" (set_color blue) (prompt_pwd) (set_color normal) \n "\$ "
end
