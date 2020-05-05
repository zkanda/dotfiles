#!/usr/bin/env bash

CURRENT_DIR=$(realpath .)
echo $CURRENT_DIR

# git
ln -sf $CURRENT_DIR/gitconfig $HOME/.gitconfig
ln -sf $CURRENT_DIR/gitignore_global $HOME/.gitignore_global

# tmux
ln -sf $CURRENT_DIR/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim
ln -sf $CURRENT_DIR/vimrc $HOME/.vimrc

# minimal bash config when connecting to server via ssh
curl -sS https://raw.githubusercontent.com/amaya382/anyrc/0.0.2/install.sh | DIR=/usr/local/bin bash
ln -s $(realpath bashrc) ~/.anyrc.d/.bashrc

