set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'chriskempson/base16-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'lukaszb/vim-web-indent'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-abolish'
Plugin 'mxw/vim-jsx'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-surround'

call vundle#end() " required
filetype plugin indent on " required

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|.+\~$)|(\.(swp|git))$'
let g:ctrlp_abbrev = {
      \ 'gmode': 'i',
      \ 'abbrevs': [
      \ {
      \ 'pattern': ' ',
      \ 'expanded': ''
      \ },
      \ ]
      \ }

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_server_python_interpreter="/usr/bin/python3"
let g:ycm_python_binary_path="/usr/bin/python3"
let g:ycm_rust_src_path="/usr/src/rust/src"

let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe = 'npm-run eslint'

let g:jsx_ext_required = 0

if filereadable('/proc/cpuinfo')
  let &makeprg = 'make -j'.(system('grep -c ^processor /proc/cpuinfo')+1)
endif

if filereadable(glob('./.vimrc.local'))
  so ./.vimrc.local
endif

autocmd CompleteDone * pclose

set nowrap

syntax on

if filereadable(expand("~/.vimrc_background"))
  set t_Co=256 
  set termguicolors
  let g:airline_theme='base16_eighties'
  let base16colorspace=256
  source ~/.vimrc_background
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set linespace=5 "fix underscores in gvim

set relativenumber
set number

set expandtab
set shiftwidth=2
set softtabstop=2

autocmd Filetype markdown setlocal tw=80
autocmd Filetype markdown setlocal wm=4
autocmd Filetype markdown setlocal fo=cat
