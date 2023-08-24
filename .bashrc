# ______               ______               
# ___  /_______ __________  /_______________
# __  __ \  __ `/_  ___/_  __ \_  ___/  ___/
# _  /_/ / /_/ /_(__  )_  / / /  /   / /__  
# /_.___/\__,_/ /____/ /_/ /_//_/    \___/  
#
# My .bashrc. This is where my bash configurations and my custom bash prompt are.


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

###---Bash History---###
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=1000 # HISTSIZE and HISTFILESIZE sets history length
HISTFILESIZE=2000
HISTFILE=~/.bash_history

###---Checking Window Size---###
shopt -s checkwinsize

###---Variable Identifying---###
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

###---Colored Bash Prompt---###
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

PS1="\[\e[1;31m\]\$(parse_git_branch)\[\033[35m\]\$(parse_git_dirty)\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;34m\]$ \[\e[0;32m\]"

###---Xterm and Urxvt Settings---###
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

###---Programming Completion Features---###
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###---Sourcing Aliases---###
[ -f "$HOME/.config/bash/aliasrc" ] && source "$HOME/.config/bash/aliasrc"

# Run figlet displaying what is the current shell at startup
basename $0 | figlet -tf Speed
