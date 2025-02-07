# Bash Customizations

This repository contains scripts for personalizing your Bash shell environment in a modular way. The idea is to keep your customizations organized in a dedicated folder (`.bash_mods`) and have an initialization script (`init.sh`) that sources all active modifications automatically.

## Features

- **Modular Customizations:**  
  Organize your Bash custom scripts (aliases, functions, prompt modifications, etc.) in one folder.
- **Automatic Sourcing:**  
  An `init.sh` file sources all scripts in the directory automatically during shell startup.
- **Git Prompt Integration:**  
  Easily integrate Git branch information into your Bash prompt alongside the native Debian 12 color scheme.

## Installation

Follow these steps to set up your customizations:

1. **Clone or Create the `.bash_mods` Directory**

   The `..bash_mods` directory must be created in your home directory, otherwise you must change the variable MODS that indicate where the repo shell files are.
   If you have not yet cloned this repository, run:
   ```bash
   git clone https://github.com/yourusername/yourrepository.git ~/.bash_mods
   ```

   Replace yourusername/yourrepository with the appropriate GitHub repository details.

Alternatively, if you're starting from scratch:
    ```bash
    mkdir -p ~/.bash_mods
    ```

2. **Modify your `.bashrc` file**

   Add the following snippet to your ~/.bashrc file to check for the .bash_mods directory and source init.sh if it exists:
    ```bash
    # For my own customizations
    MODS=".bash_mods"

    if [ -d "$HOME/$MODS" ]; then
        if [ -f "$HOME/$MODS/init.sh" ]; then
            . "$HOME/$MODS/init.sh"
        fi
    fi
    ```

3. **Reload your shell**
 
   To apply the changes, run:
    ```bash
    source .bashrc
    ```

