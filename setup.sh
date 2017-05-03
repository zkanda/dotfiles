#!/bin/bash
CURRENT_DIR=$(realpath .)

echo $CURRENT_DIR


# Git
ln -sf $CURRENT_DIR/gitconfig $HOME/.gitconfig
ln -sf $CURRENT_DIR/gitignore_global $HOME/.gitignore_global

# Tmux
ln -sf $CURRENT_DIR/tmux.conf $HOME/.tmux.conf

# Neovim
mkdir -p ~/.config/nvim/
ln -sf $CURRENT_DIR/init.vim $HOME/.config/nvim/init.vim

# Vim
ln -sf $CURRENT_DIR/vimrc $HOME/.vimrc


ln -sf $CURRENT_DIR/inputrc $HOME/.inputrc

# sshrc
ln -sf $CURRENT_DIR/sshrc $HOME/.sshrc
mkdir -p $HOME/.sshrc.d/
ln -sf $CURRENT_DIR/vimrc $HOME/.sshrc.d/.vimrc
ln -sf $CURRENT_DIR/tmux.conf $HOME/.sshrc.d/.tmux.conf
