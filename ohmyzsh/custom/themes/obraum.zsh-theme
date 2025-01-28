if [ "$USERNAME" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[green]%}[%D{%H:%M:%S}]%{$reset_color%}$(aws_prompt_info) %{${fg_bold[blue]}%}➜ %{$reset_color%}%{${fg[green]}%}%4~%{$reset_color%} $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_AWS_PREFIX=" %{$fg_bold[red]%}‹"
ZSH_THEME_AWS_SUFFIX="›%{$reset_color%}"
