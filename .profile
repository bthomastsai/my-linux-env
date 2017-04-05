# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#
# Setup Android development environment
#
if [ -d "/opt/jdk" ]; then
    PATH="/opt/jdk/bin:$PATH"
fi

if [ -d "/opt/android-studio" ]; then
    PATH="/opt/android-studio/bin/:$PATH"
fi

[ -d "$HOME/.vim/bundle/gj/bin" ] && PATH="$PATH:$HOME/.vim/bundle/gj/bin"

export IBUS_ENABLE_SYNC_MODE=1
PATH="$PATH:/opt/brcm/hndtools-mipsel-linux/bin:/opt/brcm/hndtools-mipsel-uclibc/bin:/opt/brcm-arm/bin"
