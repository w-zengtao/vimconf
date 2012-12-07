#!/usr/bin/env bash

sudo apt-get install ctags grep-ack
cd ~
git clone https://github.com/yinsigan/my_vim_config.git
ln -s ~/my_vim_config/.vimrc ~/.vimrc
ln -s ~/my_vim_config/.vimrc.map ~/.vimrc.map
ln -s ~/my_vim_config/.vimrc.plugins ~/.vimrc.plugins
ln -s ~/my_vim_config/.vimrc.bundle ~/.vimrc.bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +BundleClean +q
