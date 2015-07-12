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
alias gp="cd ~/code/promet"

# can be used to fix common typos you make
alias pdw='pwd'

# git shortcuts
alias push='git push origin master'
alias pull='git pull'

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'

# Detect what is my platform
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux'  ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin'  ]]; then
    platform='darwin'
fi

# Virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
if [[ $platform == 'linux' ]]; then
    source /usr/bin/virtualenvwrapper.sh
elif [[ $platform == 'darwin' ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Language Settings
LANGUAGE=en_US:en
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

#Google Cloud
export CLOUDSDK_PYTHON=python2
# The next line updates PATH for the Google Cloud SDK.
source '$HOME/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '$HOME/google-cloud-sdk/completion.zsh.inc'

