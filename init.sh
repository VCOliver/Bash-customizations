#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$HOME/.bash_mods"

# Exporting color variables
. $SCRIPT_DIR/colors.sh

# Adding found git branch
. $SCRIPT_DIR/git.sh

# Modifying prompt PS1
. $SCRIPT_DIR/prompt.sh
