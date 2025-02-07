
set_prompt(){

    local USER_COLOR=$BOLD_GREEN
    local CWD_COLOR=$BOLD_BLUE
    local FULL_PATH_COLOR=$GREY 

    # Build the prompt string in parts
    PS1="\[${FULL_PATH_COLOR}\][\w]\[${COLOR_RESET}\]\n"
    PS1+="${debian_chroot:+($debian_chroot)}"
    PS1+="\[${USER_COLOR}\]\u@\h\[${COLOR_RESET}\]:"
    PS1+="\[${CWD_COLOR}\]\W\[${COLOR_RESET}\]"
    PS1+=$GIT_BRANCH
    PS1+=" -> "

    export PS1
}

set_prompt

unset -f set_prompt
