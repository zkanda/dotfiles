# .bashrc
 
export HISTSIZE=10000                      # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '    # using strftime format
export HISTCONTROL=ignoreboth              # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"
 
export PS1="\W > "
 
alias ll='ls -lahG'
alias home='cd ~'
alias up='cd ..'
alias h='history'
alias p='cd ~/projects'
 
# can also redefine a command to add options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
 
# can be used to fix common typos you make
alias pdw='pwd'
 
# git shortcuts
alias push='git push origin master'
alias pull='git pull'
 
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
 
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
 
