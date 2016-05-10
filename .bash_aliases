
alias gitsu='git status --untracked-files=no'
alias grep='grep --color=auto'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
# alias cp='cp -i'
alias mv='mv -i'
alias svnvimdiff='svn diff --diff-cmd $HOME/bin/diffwrap.sh'
alias cgrep='grep --include="*.[chsS]"'
alias sdcv='sdcv -n'
alias svnurl="svn info | awk '/^URL/ {print \$2}'"
##alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
