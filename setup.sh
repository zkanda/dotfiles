#!/bin/bash
GH_HOME=$HOME/code/github.com


# Git
ln -sf $GH_HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -sf $GH_HOME/dotfiles/gitignore_global $HOME/.gitignore_global

# Tmux
ln -sf $GH_HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Vim
ln -sf $GH_HOME/dotfiles/vimrc $HOME/.vimrc

