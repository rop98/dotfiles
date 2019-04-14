""{{{,BACKUP
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set noswapfile
set colorscheme murphy
""}}}
let mapleader="\<Space>"
""File handling
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>ff :e 
nnoremap <leader>fed :e ~/.vimrc<CR>
set guioptions -=T
set guioptions -=m
set guioptions-=r  "scrollbar
"
"====Plugins=======================================================
call plug#begin('~/.vim/bundle')
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-latex/vim-latex'
Plug 'suan/vim-instant-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'zef/vim-cycle'
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'wellle/targets.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'othree/html5.vim'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/Emmet.vim'
Plug 'junegunn/vim-easy-align'

" call PlugInstall to install new plugins
call plug#end()


    "sourcing from vimsnip
    source ~/.config/script/vimsnip/latex.vim
    source ~/.config/script/vimsnip/common.vim

