gvimrc
======

![vim screenshot](https://raw.github.com/yinsigan/gvimrc/master/screenshots/example.png)

1. 安装所需要的ctags和grep-ack

  ```
  $ sudo apt-get install ctags grep-ack
  ```

2. clone repository and link .vimrc

  ```
  cd ~
  $ git clone https://github.com/yinsigan/gvimrc.git
  ln -s ~/gvimrc/.vimrc ~/.vimrc
  ```

3. 安装vundle

  ```
  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```

4. 在gvim中安装所有插件

  ```
  :BundleInstall
  ```

