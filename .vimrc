set nocompatible " be iMproved
filetype off " required!

call vundle#rc() 

Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'chriskempson/base16-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'lukaszb/vim-web-indent'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'

filetype plugin indent on " required

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)'

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsSnippetsDir = '/usr/share/vim/vimfiles/UltiSnips/'
let g:UltiSnipsSnippetDirectories=['/usr/share/vim/vimfiles/UltiSnips/']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

let g:syntastic_check_on_open=1

if filereadable('/proc/cpuinfo')
	let &makeprg = 'make -j'.(system('grep -c ^processor /proc/cpuinfo')+1)
endif

set nowrap

colorscheme base16-default
set background=dark

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set linespace=5 "fix underscores in gvim

set expandtab
set shiftwidth=2
set softtabstop=2
