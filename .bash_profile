# ______               ______                      __________________     
# ___  /_______ __________  /_________________________  __/__(_)__  /____ 
# __  __ \  __ `/_  ___/_  __ \__  __ \_  ___/  __ \_  /_ __  /__  /_  _ \
# _  /_/ / /_/ /_(__  )_  / / /_  /_/ /  /   / /_/ /  __/ _  / _  / /  __/
# /_.___/\__,_/ /____/ /_/ /_/_  .___//_/    \____//_/    /_/  /_/  \___/ 
#                             /_/                                         
#
# My .bash_profile. This is where I set and export my environment variables if I'm using the bash shell.

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Setting $PATH variables
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin

# Setting $XDG Environment Variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"

# Bash history
export HISTFILE="${XDG_STATE_HOME}"/bash/history

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
