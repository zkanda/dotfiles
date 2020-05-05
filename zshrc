# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

export GOPATH=~/code/go

gitcmd() {
    pr_branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull -p
    git branch -D $pr_branch
}

