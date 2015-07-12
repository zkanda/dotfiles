#!/bin/bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
GH_HOME=$HOME/code/github.com
mkdir -p $GH_HOME
ln -sf $GH_HOME/dotfiles/zlogin $HOME/.zlogin
ln -sf $GH_HOME/dotfiles/zlogout $HOME/.zlogout
ln -sf $GH_HOME/dotfiles/zpreztorc $HOME/.zpreztorc
ln -sf $GH_HOME/dotfiles/zprofile $HOME/.zprofile
ln -sf $GH_HOME/dotfiles/zshenv $HOME/.zshenv
ln -sf $GH_HOME/dotfiles/zshrc $HOME/.zshrc

# Git
ln -sf $GH_HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -sf $GH_HOME/dotfiles/gitignore_global $HOME/.gitignore_global

# Tmux
ln -sf $GH_HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Setup my Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $GH_HOME/dotfiles/vimrc $HOME/.vimrc

# Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | /home/.fzf/install

# For ruby
ln -sf $GH_HOME/dotfiles/gemrc $HOME/.gemrc
