
set_prompt(){

    local USER_COLOR='\033[1;32m'
    local CWD_COLOR='\033[1;34m'
    local FULL_PATH_COLOR='\033[0;90m'

	local DEBIAN_SYMBOL_COLOR=$(get_color fg 168 0 48)
	local DEBIAN_SYMBOL=$(echo -e "$mfizz_debian")

    # Build the prompt string in parts
    PS1="\[${FULL_PATH_COLOR}\][\w]\[${COLOR_RESET}\]\n"
	PS1+="${debian_chroot:+($debian_chroot)}"
    PS1+="\[${DEBIAN_SYMBOL_COLOR}\]\[${DEBIAN_SYMBOL}\] " 
	PS1+="\[${USER_COLOR}\]\u \[${COLOR_RESET}\]@"
    PS1+="\[${CWD_COLOR}\]\W\[${COLOR_RESET}\] "
    PS1+=$GIT_BRANCH
    PS1+=" -> "

    export PS1
}

set_prompt

unset -f set_prompt
