set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'chriskempson/base16-vim'
Plugin 'mhartington/oceanic-next'
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
Plugin 'flowtype/vim-flow'
Plugin 'takac/vim-hardtime'
Plugin 'beyondmarc/glsl.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'

call vundle#end() " required
filetype plugin indent on " required

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|lib|.+\~$)|(\.(swp|git))$'
let g:ctrlp_abbrev = {
      \ 'gmode': 'i',
      \ 'abbrevs': [
      \ {
      \ 'pattern': ' ',
      \ 'expanded': ''
      \ },
      \ ]
      \ }

let g:deoplete#enable_at_startup = 1

let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_javascript_checkers=['eslint', 'flow']
let g:syntastic_javascript_eslint_exe = 'eslint_d --cache'
let g:syntastic_javascript_flow_exe = 'npm-run flow'

let g:jsx_ext_required = 0

let g:hardtime_default_on = 0

let g:flow#enable = 0
let g:flow#autoclose = 1

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow = getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

if filereadable('/proc/cpuinfo')
  let &makeprg = 'make -j'.(system('grep -c ^processor /proc/cpuinfo')+1)
endif

if filereadable(glob('./.vimrc.local'))
  so ./.vimrc.local
endif

autocmd CompleteDone * pclose

set nowrap

syntax on
set bg=dark
set termguicolors
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
highlight Normal ctermbg=NONE guibg=NONE "transparent background

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

au FileType markdown setl wrap linebreak nolist
au FileType go setl ts=4 sw=4 sts=4 noexpandtab
