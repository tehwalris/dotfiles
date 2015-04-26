set nocompatible " be iMproved
filetype off " required!

call vundle#rc() 

Plugin 'Valloric/YouCompleteMe'

filetype plugin indent on " required


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set nowrap
