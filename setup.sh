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


# Tmux
sudo apt install xsel
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# caps2esc

# Ubuntu
#sudo apt install libevdev-dev libudev-dev -y

# Fedora
sudo dnf install @development-tools curl file git irb python-setuptools ruby xsel -y
sudo dnf install libevdev-devel libudev-devel -y

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# git clone git@github.com:oblitum/caps2esc.git
# cd caps2esc
# git checkout 5dc8546c20ac7f0feb6ef4a8c4f53187ebef44b4
# gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev
# sudo mv ./caps2esc /usr/local/bin/caps2esc
# sudo cp ../caps2esc.service /etc/systemd/system/caps2esc.service
# sudo systemctl enable caps2esc
# sudo systemctl start caps2esc
# cd ..
# rm -rf caps2esc/

