set nocompatible
filetype plugin indent on
syntax on

set number

" 减少刷新和重画
set lz

set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent

let mapleader = ','

" 文字过长时不断行显示
set nowrap

" set tags=~/.rvm/gems/ruby-1.9.3-p194/gems/tags,./tags

" 设置折叠方法
set fdm=manual

" 进入编辑模式时按tab弹出菜单
set wildmenu
set wildmode=list:longest,full

" 修复backspace键的作用
inoremap <BS> <Left><Del>
set whichwrap+=[

" 设置一行最多80个字符
set textwidth=80

" 自动重新读入
set autoread

" 备份和缓存
set nobackup
set noswapfile
set nowritebackup

" 高亮搜索
set hlsearch
set incsearch

" no bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set mouse=a

" list chars
set list
set listchars=""                  
set listchars=tab:\ \             
set listchars+=trail:.            
set listchars+=extends:>          
set listchars+=precedes:<         

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 搜索时忽略大小写
set ignorecase
set smartcase

" 设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 设置标题
set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70"

" 高亮当前行
"set cursorline

" 修改 vmirc 后自动生效
map <leader>s :source ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

" 去掉工具栏
set go-=T

" 回到上次编辑的地方
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" vundle setting
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
endif

if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

if filereadable(expand("~/.vimrc.map"))
  source ~/.vimrc.map
endif

" colorscheme
set t_Co=256
set background=dark
if has("gui_running")
  " colorscheme solarized
  colorscheme molokai
  set linespace=2
  set lines=35
  set columns=100
else
  colorscheme molokai
endif

if has("gui_macvim")
  set guifont=Monaco:h17
elseif has("gui_gtk")
  set guifont=Monospace\ 12
else
  set guifont=Monaco:h17
end
