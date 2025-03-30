#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$HOME/.bash_mods"

# Export icon names
source ~/.local/share/icons-in-terminal/icons_bash.sh

# Exporting color variables
. $SCRIPT_DIR/colors.sh

# Adding found git branch
. $SCRIPT_DIR/git.sh

# Modifying prompt PS1
. $SCRIPT_DIR/prompt.sh
