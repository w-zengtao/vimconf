set nocompatible
filetype plugin indent on
 
" 显示行号
set number
 
" 设置四个空格对齐
set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
 
" 缩进
set autoindent
set smartindent
 
" 设置一行最多80个字符
set textwidth=80
   
" 自动重新读入
set autoread
 
" 备份和缓存   
set nobackup
set noswapfile
set nowritebackup
 
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
 
" 搜索时忽略大小写
set ignorecase
set smartcase
 
" 设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
 
" 高亮当前行
" set cursorline

"修改 vmirc 后自动生效
map <leader>s :source ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc
 
" 保证语法高亮
syntax on

" 去掉工具栏
set go-=T

" 使用 tab 及 shift-tab 进行缩排
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 按ctrl+s保存文件
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

" 回到上次编辑的地方
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       设置状态行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" 获得当前目录
function! CurrectDir()
return substitute(getcwd(), "", "", "g")
endfunction
 
" 返回当前时间
func! GetTimeInfo()
return strftime('%Y-%m-%d %A %H:%M:%S')
endfunction
 
" 命令行于状态行
set ch=1
set statusline=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{CurrectDir()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       括号补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")

    func! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    au FileType php,c,python,java,javascript,ruby exe AutoClose()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
"字典文件设置
" au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
" au FileType css setlocal dict+=~/.vim/dict/css.dict
" au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
" au FileType java setlocal dict+=~/.vim/dict/java.dict
" au FileType perl setlocal dict+=~/.vim/dict/perl.dict
" au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
" au FileType c setlocal dict+=~/.vim/dict/c.dict
" au FileType lua setlocal dict+=~/.vim/dict/lua.dict
" au FileType scheme setlocal dict+=~/.vim/dict/scheme.dict
" au FileType scala setlocal dict+=~/.vim/dict/scala.dict
" au FileType vim setlocal dict+=~/.vim/dict/vim.dict
" au FileType ocaml setlocal dict+=~/.vim/dict/ocaml.dict
"设置taglist快捷键
nnoremap <silent> <F8> :TlistToggle<CR>
   
"python自动完成
" let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

" call pathogen#infect()

" 打开就开启NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" vundle插件设置
let root = '~/.vim/bundle'
if !isdirectory(expand(root).'/vundle')
  exec '!git clone http://github.com/gmarik/vundle.git '.root.'/vundle'
endif

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ack插件设置
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" NERDTree快捷键
nmap ,n :NERDTree<CR>
nmap ri :NERDTreeFind<CR>

Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'kien/ctrlp.vim.git'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "taglist.vim"
Bundle "mileszs/ack.vim"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-surround"
Bundle "othree/xml.vim"
Bundle "fholgado/minibufexpl.vim"
Bundle "tpope/vim-commentary"
" Bundle 'vim-scripts/AutoComplPop.git' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "                                复制与粘贴     
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP

cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> 	<C-V>
vmap <S-Insert> 	<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   	<C-V>

if has("virtualedit")
  let paste#paste_cmd = {'n': ":call paste#Paste()<CR>"}
  let paste#paste_cmd['v'] = '"-c<Esc>' . paste#paste_cmd['n']
  let paste#paste_cmd['i'] = 'x<BS><Esc>' . paste#paste_cmd['n'] . 'gi'

  func! paste#Paste()
    let ove = &ve
    set ve=all
    normal! `^
    if @+ != ''
      normal! "+gP
    endif
    let c = col(".")
    normal! i
    if col(".") < c " compensate for i<ESC> moving the cursor left
      normal! l
    endif
    let &ve = ove
  endfunc
else
  let paste#paste_cmd = {'n': "\"=@+.'xy'<CR>gPFx\"_2x"}
  let paste#paste_cmd['v'] = '"-c<Esc>gix<Esc>' . paste#paste_cmd['n'] . '"_x'
  let paste#paste_cmd['i'] = 'x<Esc>' . paste#paste_cmd['n'] . '"_s'
endi

