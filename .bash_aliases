
alias gitsu='git status --untracked-files=no'
alias grep='grep --color=auto'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
# alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias svnvimdiff='svn diff --diff-cmd $HOME/bin/diffwrap.sh'
alias cgrep='grep --include="*.[chsS]"'
alias sdcv='sdcv -n'
alias svnurl="svn info | awk '/^URL/ {print \$2}'"
##alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ack='ack-grep'
alias myuci='uci -c /home/thomas/projects/standalone-uci/config'

# for sdcv dictionaries
alias longdao='sdcv -n -u "朗道英漢字典5.0"'
alias longman='sdcv -n -u "Longman Dictionary of Contemporary English"'
alias oxford='sdcv -n -u "牛津現代英漢雙解詞典"'

