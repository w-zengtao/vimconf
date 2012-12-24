#!/usr/bin/env bash

sudo apt-get install ctags grep-ack
cd ~
git clone git://github.com/yinsigan/vimconf.git
ln -s ~/vimconf/.vimrc ~/.vimrc
ln -s ~/vimconf/.vimrc.map ~/.vimrc.map
ln -s ~/vimconf/.vimrc.plugins ~/.vimrc.plugins
ln -s ~/vimconf/.vimrc.bundle ~/.vimrc.bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +BundleClean +q
