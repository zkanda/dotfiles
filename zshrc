#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set my default user
export DEFAULT_USER=$USER

# Prefered editor
export EDITOR=vim

# Personal settings
export HISTSIZE=10000 # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftime format
export HISTCONTROL=ignoreboth # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"
 
alias ll='ls -lahG'
alias home='cd ~'
alias up='cd ..'
alias h='history'
 
# can also redefine a command to add options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias p="cd ~/projects"
alias gh="cd ~/code/github.com"
 
# can be used to fix common typos you make
alias pdw='pwd'
 
# git shortcuts
alias push='git push origin master'
alias pull='git pull'

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'


# Virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
