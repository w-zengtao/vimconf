# vimrc

my vim config


## install

1. ctags and grep-ack(require)

  ```
  $ sudo apt-get install ctags grep-ack
  ```

2. clone repository and link .vimrc

  ```
  $ cd ~
  $ git clone https://github.com/yinsigan/my_vim_config.git
  $ ln -s ~/my_vim_config/.vimrc ~/.vimrc
  $ ln -s ~/my_vim_config/.vimrc.map ~/.vimrc.map
  $ ln -s ~/my_vim_config/.vimrc.plugins ~/.vimrc.plugins
  $ ln -s ~/my_vim_config/.vimrc.bundle ~/.vimrc.bundle
  ```

3. install vundle plugin manange

  ```
  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```

4. install all plugins

  ```
  $ vim +BundleInstall! +BundleClean +q
  ```

## plugins list

  * zencoding-vim
  * nerdtree
  * ctrlp
  * snipmate-snippets
  * taglist
  * ack
  * vim-rails
  * vim-surround
  * bufexplorer
  * vim-fugitive
  * nerdcommenter
  * vim-powerline
  * vim-endwise
  * tabular
  * vim-css-color
  * supertab
  * matchit
  * vim-easymotion
  * autoclose
  * vim-indent-guides

## syntax higlight

  * jquery
  * go
  * slim
  * coffee-script
  * haml
  * markdown
  * cucumber
  * less
  * json
