#!/bin/bash

export CONF_PATH=$HOME/.config/my_config
export VIM_CONF=$HOME/.config/my_vim

# zsh
ln -s $CONF_PATH/zshrc $HOME/.zshrc

# vim
git clone git@github.com:Geam/config_vim $VIM_CONF
ln -s $VIM_CONF/ $HOME/.vim
ln -s $VIM_CONF/vimrc $HOME/.vimrc
vim
