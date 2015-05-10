set nocompatible " be iMproved
filetype off " required!

call vundle#rc() 

Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'chriskempson/base16-vim'

filetype plugin indent on " required

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:UltiSnipsSnippetsDir = '/usr/share/vim/vimfiles/UltiSnips/'
let g:UltiSnipsSnippetDirectories=['/usr/share/vim/vimfiles/UltiSnips/']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

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
