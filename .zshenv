#             ______                     
# _______________  /________________   __
# ___  /_  ___/_  __ \  _ \_  __ \_ | / /
# __  /_(__  )_  / / /  __/  / / /_ |/ / 
# _____/____/ /_/ /_/\___//_/ /_/_____/  
#
# My .zshenv file. This file contains the environment variables that I have set and exported for the zsh shell.

# Setting $PATH variables
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin

# Setting $XDG Environment Variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"

# Setting default editor
export EDITOR="nvim"
export SUDO_EDITOR="nvim"

# Colorize man pages and similar documentation using less
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"
export RI_PAGER="less -R --use-color -Dd+r -Du+b"

# Use less (with colors) to format everything
export LESS='-RXF --use-color -Dd+r$Du+b'

# Use rofi to run clipmenu (clipboard manager) instead of using dmenu
export CM_LAUNCHER='rofi'
