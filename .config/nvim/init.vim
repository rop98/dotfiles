""{{{,BACKUP
set backupdir=~/.config/nvim/tmp/backup/
set directory=~/.config/nvim/tmp/swap/
set backup
set noswapfile
""}}}
let mapleader="\<Space>"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:pymode_python = 'python3'
let g:deoplete#auto_complete_delay = 100
hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
filetype plugin on
filetype indent on
""File handling
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>ff :FZF<CR> 
nnoremap <leader>fed :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>fd :e 
nnoremap <leader>fer :split ~/.config/script/vimsnip/
nnoremap <leader>C :split ~/docs/cheats/
nnoremap <f8> :tabe %:p:h<cr>
let g:Tex_ViewRule_pdf = 'llpp'
nnoremap <A-'> >}
\#vim:filetype=i3
set mouse=a
"====Plugins=======================================================
call plug#begin('~/.config/nvim/bundle')
"Must haves
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'zef/vim-cycle'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/space-vim-dark'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Notetaking
"Plug 'vimwiki/vimwiki' 
"Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim'
Plug 'w0rp/ale'       "Asynchronous linting engine
Plug 'python-mode/python-mode', { 'branch': 'develop' }
"latex
Plug 'vim-latex/vim-latex'
"Previews
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'ap/vim-css-color'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'nathanaelkane/vim-indent-guides'
"Web
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/Emmet.vim'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
"Java 
Plug 'sbdchd/neoformat'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'
" call PlugInstall to install new plugins
call plug#end()

""
	"vim latex live preview
    let g:neotex_pdflatex_alternative = 'xelatex'
    let g:tex_flavor = 'xelatex'
		autocmd Filetype tex setl updatetime=2
		nnoremap <F12> :NeoTex<cr>
	  nnoremap <leader>p :!openpdf %


    "sourcing from vimsnip
    source ~/.config/script/vimsnip/latex.vim
    source ~/.config/script/vimsnip/common.vim

""""    deoplete     """"
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
""""  Java Complete  """"
autocmd FileType java setlocal omnifunc=javacomplete#Complete
""""     neomake     """"
autocmd! BufWritePost,BufEnter * Neomake
""""     neoformat   """"
augroup astyle
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

"Change working directory on new tab
function! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    let dirname = fnamemodify(a:path, ":h")
  endif
  execute "tcd ". dirname
endfunction()

autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

"fzf
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
if !has('nvim')
      set viminfo+=~/.vim/viminfo
    endif
