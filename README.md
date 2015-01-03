dotfiles
========

Contains all my Linux configuration.

### Setup

I use [Prezto](https://github.com/sorin-ionescu/prezto)

Installation:

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
GH_HOME=$HOME/code/github.com
ln -sf $GH_HOME/dotfiles/zlogin $HOME/.zlogin
ln -sf $GH_HOME/dotfiles/zlogout $HOME/.zlogout
ln -sf $GH_HOME/dotfiles/zpreztorc $HOME/.zpreztorc
ln -sf $GH_HOME/dotfiles/zprofile $HOME/.zprofile
ln -sf $GH_HOME/dotfiles/zshenv $HOME/.zshenv
ln -sf $GH_HOME/dotfiles/zshrc $HOME/.zshrc
```
