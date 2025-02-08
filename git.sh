#!/bin/bash

# Source Git's prompt script if it exists.
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_COLOR=$BOLD_CYAN
BRANCH_COLOR=$LIGHT_YELLOW

GIT_BRANCH="\$(__git_ps1 \"\[${GIT_COLOR}\]:(\[${BRANCH_COLOR}\]%s\[${GIT_COLOR}\])\[${COLOR_RESET}\]\")"

# Customize the prompt; %s is replaced with the branch name by __git_ps1.
export GIT_BRANCH
