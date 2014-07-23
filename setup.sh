#!/bin/bash
sudo apt-get install vim tmux git zsh tree python-pip
sudo pip install virtualenvwrapper
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
