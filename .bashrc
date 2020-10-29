# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# [ -z "$PS1" ] && return
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=3000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set debian version
if [ -f /etc/debian_version ]; then 
    debian_version=$(cat /etc/debian_version)
fi

# set machine mode
machine=$(uname -m)

# set hostname
hname=$(cat /etc/hostname)

function parse_git_branch { 
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    url=$(git remote show -n origin 2> /dev/null | sed -n 's/Fetch URL:\ //p')
    [ -n "${branch}" ] && [ -n "${url}" ] && echo "$url->$branch"
} 

function git_url {
    url=$(git remote show -n origin 2> /dev/null | sed -n 's/Fetch URL:\ //p')
    [ -n "${url}" ] && echo "$url"
}

function git_branch {
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    [ -n "${branch}" ] && echo "$branch"
}

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$debian_version" in
#6.0.9)
#    PS1='<\[\033[04;33m\]\u@$debian_version\[\033[00m\]:\w/\n\T\$>'
#    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='<\[\033[01;32m\]\u@${hname}\[\033[00m\]:\w\[\033[01;31m\]$(git_url)\[\033[00m\]\[\033[01;33m\]->$(git_branch)\[\033[00m\]/\n\T\$>'
    #PS1='<\[\033[01;32m\]\u@${hname}\[\033[00m\]:\w\[\033[01;31m\]$>'
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#if [ "$TERM" != "xterm-256color" ]; then
#    export TERM=xterm-256color
#fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## 
## SSH client setting
##
#SSH_ENV=$HOME/.ssh/environment
## start the ssh-agent
#function start_agent {
#    echo "Initializing new SSH agent..."
#    # spawn ssh-agent
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add
#}
#
#if [ -f "${SSH_ENV}" ]; then
#    . "${SSH_ENV}" > /dev/null
#    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#    start_agent;
#    }
#else
#    start_agent;
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi
export SDCV_PAGER=/usr/bin/less
export EDITOR=vim
#set -o vi
#bind '"\x1b\x5b\x41":history-search-backward'
#bind '"\x1b\x5b\x42":history-search-forward'

export LC_CTYPE=C 
export LANG=C

#
# git auto complete 
#
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

#
# Set my locale
# 
export LANG="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


#
# Disable Lenovo T430s touchpad
#
#export DISPLAY=:0.0
#[ ! -z `which xinput` ] && touchpad_id=$(xinput list | grep "TouchPad" | awk -F"id=" '{print $2}' | awk '{print $1}')
#[ -n "${touchpad_id}" ] && touch_state=$(xinput list-props ${touchpad_id} | grep "Device Enabled" | awk '{print $4}')
#[ -n "${touch_state}" ] && [ ${touch_state} -eq 1 ] && xinput set-prop ${touchpad_id} "Device Enabled" 0


#
# GNU Global
# 
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=ctags-exuberant
export GTAGSLABEL=pygments

