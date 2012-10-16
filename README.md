vimrc
=====

1. 安装所需要的ctags和grep-ack

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

3. 安装vundle

  ```
  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```

4. 在gvim中安装所有插件

  ```
  :BundleInstall
  ```

