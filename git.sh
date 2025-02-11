#!/bin/bash

# Source Git's prompt script if it exists.
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_COLOR='\033[1;36m'
BRANCH_COLOR='\033[38;5;226m'
GIT_SYMBOL_COLOR=$(get_color fg 245 77 39)
GIT_SYMBOL=$(echo -e "$mfizz_git")

GIT_BRANCH="\$(__git_ps1 \"\[${GIT_SYMBOL_COLOR}\]\[${GIT_SYMBOL}\] \[${GIT_COLOR}\]:(\[${BRANCH_COLOR}\]%s\[${GIT_COLOR}\])\[${COLOR_RESET}\]\")"

# Customize the prompt; %s is replaced with the branch name by __git_ps1.
export GIT_BRANCH
