#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Exporting color variables
. $SCRIPT_DIR/colors.sh

# Adding found git branch
. $SCRIPT_DIR/git.sh
