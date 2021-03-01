# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -r /home/javier/.byobu/prompt ] && . /home/javier/.byobu/prompt   #byobu-prompt#

# PS1 Config
git_ref() {
  local BRIGHT_WHITE="\[\e[1;97m\]"
  local RESET_ATTR="\[\e[0m\]"

  echo -n "${BRIGHT_WHITE}"
  local BRANCH_NAME=$(git branch 2>/dev/null | grep -e "^\*" | sed -E "s/^\* //")
  if [ -z "$BRANCH_NAME" ]; then
    echo -n ""
  elif [ "$BRANCH_NAME" == "(no branch)" ]; then
    local REF_NAME=$(git rev-parse --short HEAD)
    echo -n "[$REF_NAME] "
  else
    echo -n "($BRANCH_NAME) "
  fi
  echo -n "${RESET_ATTR}"
}

last_cmd() {
  # Returns the errocode of the last executed command in bold red
  # only if it was different than zero
  local LAST_CMD=$?
  if [ "$LAST_CMD" != "0" ]; then
    local BOLD_REVERSED_RED="\[\e[1;31;7m\]"
    local RESET_ATTR="\[\e[0m\]"
    echo -e "${BOLD_REVERSED_RED}${LAST_CMD}${RESET_ATTR} "
  fi
}

set_bash_prompt() {
  # Escape non-printable sequences with \[ and \]
  # Otherwise, lines will be screwed up and long lines will wrap around too early without
  # a newline character.
  
  # Using $(cmd) calls the command at the time the PS1 is generated.
  # Don't use \$(cmd), as this will suffer the same issue above if we have non-printable characters
  # within those functions that are wrapped (the wrapping will be visible).

  # example output when the git repo is not in a branch
  #   username@hostname: mydir [commit_sha] $
  # example output when git repo is in a branch
  #   username@hostname: mydir (mybranch) $
  # example output when there is not git repo:
  #   username@hostname: mydir $
  # example output when the last command failed (errcode != 0)
  #   errcode username@hostname: mydir $

  PS1="$(last_cmd)"
  local BOLD_GREEN="\[\e[1;32m\]"
  local BOLD_BLUE="\[\e[1;34m\]"
  local RESET_ATTR="\[\e[0m\]"
  PS1+="${BOLD_GREEN}\u@\h:${BOLD_BLUE}\w${RESET_ATTR} "
  PS1+="$(git_ref)"
  PS1+="\$ "
}
PROMPT_COMMAND=set_bash_prompt

# aliases
alias l='exa -F'
alias ls='exa -F'
alias lt='exa -F -a --tree'
alias la='exa -F -a'
alias ll='exa -laFb --git --group --header'
alias gits='git status'
alias gitl='git log --oneline --decorate --graph'
alias cat='bat'

# Rust config
source "$HOME/.cargo/env"

# Add binaries to path
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Documents/devtools/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH
export PATH=$HOME/Documents/devtools/android-studio/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/Documents/devtools/openocd/src:$PATH
export OPENOCD_SCRIPTS=/home/javier/Documents/devtools/openocd/tcl

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
