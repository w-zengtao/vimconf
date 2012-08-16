set nocompatible
filetype plugin indent on

" 显示行号
set number
let mapleader = ','

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

set list
" list chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the
                                  " right of the screen
set listchars+=precedes:<         " The character to show in the last column when
                                  " wrap is off and the line continues beyond
                                  " theright of the screen

" 启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

" 搜索时忽略大小写
set ignorecase
set smartcase

" 设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 高亮当前行
" set cursorline

"修改 vmirc 后自动生效
"map <leader>s :source ~/.vimrc<cr>
"autocmd! bufwritepost .vimrc source ~/.vimrc

" 保证语法高亮
syntax on

" 去掉工具栏
set go-=T

" 按ctrl+s保存文件
"nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>

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
" function! CurrectDir()
" return substitute(getcwd(), "", "", "g")
" endfunction

" 返回当前时间
" func! GetTimeInfo()
" return strftime('%Y-%m-%d %A %H:%M:%S')
" endfunction

" 命令行于状态行
" set ch=1
" set statusline=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{CurrectDir()}%h\ %=\ [Line]%l/%L\ %=\[%P]
" set ls=2 " 始终显示状态行

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
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" vundle插件设置
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


nmap ,n :NERDTree<CR>
nmap ri :NERDTreeFind<CR>

Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'kien/ctrlp.vim.git'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
"Bundle "honza/snipmate-snippets"
" Bundle "garbas/vim-snipmate"
Bundle 'garbas/vim-snipmate'
Bundle 'spf13/snipmate-snippets'

Bundle "taglist.vim"
Bundle "mileszs/ack.vim"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-surround"
Bundle "othree/xml.vim"
" Bundle "fholgado/minibufexpl.vim"
Bundle "tpope/vim-commentary"
Bundle 'vim-scripts/sessionman.vim'
Bundle 'corntrace/bufexplorer'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'AutoClose'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'taxilian/vim-web-indent'
Bundle 'HTML-AutoCloseTag'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'spf13/vim-markdown'
Bundle 'spf13/vim-preview'
Bundle 'tpope/vim-cucumber'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'godlygeek/tabular'
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
  source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
endif

" Bundle 'vim-scripts/AutoComplPop.git' 
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }

" NerdTree {
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" }
" Session List {
     set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
     nmap <leader>sl :SessionList<CR>
     nmap <leader>ss :SessionSave<CR>
  " }
" Buffer explorer {
    nmap <leader>b :BufExplorer<CR>
 " }
 " ctrlp {
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_max_height = 20
 "}
" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
 "}
    " Tabularize {
          nmap <Leader>a= :Tabularize /=<CR>
          vmap <Leader>a= :Tabularize /=<CR>
          nmap <Leader>a: :Tabularize /:<CR>
          vmap <Leader>a: :Tabularize /:<CR>
          nmap <Leader>a:: :Tabularize /:\zs<CR>
          vmap <Leader>a:: :Tabularize /:\zs<CR>
          nmap <Leader>a, :Tabularize /,<CR>
          vmap <Leader>a, :Tabularize /,<CR>
          nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

          " The following function automatically aligns when typing a
          " supported character
          inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

          function! s:align()
              let p = '^\s*|\s.*\s|\s*$'
              if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                  Tabularize/|/l1
                  normal! 0
                  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
              endif
          endfunction

     " }
" ack插件设置
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set background=dark
colorscheme solarized
set linespace=2

if has("gui_macvim")
  set guifont=Monaco:h17
elseif has("gui_gtk")
  set guifont=Monospace\ 13
else
  set guifont=Monaco:h17
end

"Ctrl-c to copy in + buffer from visual mode
vmap <C-c> "+y

"Ctrl-p to paste from the + register in cmd mode
map <C-b> "+p

"Ctrl-p to paste from the + register while editing
imap <C-b> <esc><C-b>


