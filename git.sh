#!/bin/bash

# Source Git's prompt script if it exists.
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_COLOR=$BOLD_CYAN
BRANCH_COLOR=$LIGHT_YELLOW

# Customize the prompt; %s is replaced with the branch name by __git_ps1.
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" \[${GIT_COLOR}\]git:(\[${BRANCH_COLOR}\]%s:\[${GIT_COLOR}\])\[${COLOR_RESET}\] \")\$ "
