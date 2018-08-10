"{{{,CODING SPECIFIC
"------------------------
autocmd BufEnter * silent! lcd %:p:h
set lazyredraw
set ttyfast
set pastetoggle=<F2>
set number
set relativenumber 
set autoindent
set mouse=a 
let g:indent_guides_enable_on_vim_startup=1
set colorcolumn=100
set cursorline
syntax enable
set showmatch
set ruler
set nowrap
set incsearch
set hlsearch
set smartcase
""}}}
""
""{{{,TABS
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
""}}}
""
""{{{,"FOLDS
set foldenable
set ignorecase
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker "indent
""}}}
""
""{{{,BACKUP
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set noswapfile
""}}}
""{{{, Etc
nnoremap <F5> :silent update<Bar>silent !chromium %:p &<CR>
inoremap <F5> :silent update<Bar>silent !chromium %:p &<CR>
nnoremap <F11> :exe ':silent !chromium %'<CR>
filetype plugin indent on
filetype plugin on
"""}}}
""
""{{{, GENERAL
colorscheme koehler
set clipboard=unnamedplus,unnamed
"runtime macros/matchit.vim
let mapleader="\<Space>"
"" split line (reverse of J)
nnoremap K i<CR><Esc>
"space+fs save
nnoremap <leader>fs :w<CR>
"" space+fs quit
nnoremap <leader>wd :q<CR>
"" ; for commands
nnoremap ; :
"" sane behaviour for searching and colon
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g: g;zz
nnoremap g, g,zz
"nnoremap <silent> <esc> :noh<cr><esc>
"" leader s for confirm sub, leader S for glob s
nnoremap <leader>s :%s//gc
nnoremap <leader>S :%s//g
"" sane defaults
nnoremap D d$
nnoremap Y y%
" Tab navigation like Firefox.
nnoremap <C-S-n> :tabprevious<CR>
nnoremap <C-n>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
"word count with f3
map <F3> :!wc <C-R>%<CR>
" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l
""}}}
""
""{{{,fOR LATEX
	autocmd FileType tex nnoremap <leader>pd :!pdflatex %
	autocmd FileType tex nnoremap <leader>pxd :!xelatex %
	" Word count:
		autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
		autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile document using xelatex:
		autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
		autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	"vim latex live preview
		let g:livepreview_previewer = 'llpp.inotify'
		autocmd Filetype tex setl updatetime=2
		nnoremap <F12> :LLPStartPreview<cr>
	"Latex commands
	" Open my bibliography file in split
		map <F9> :vsp<space>~/docs/latex/uni.bib<CR>
		map <leader>b :vsp<space>~/docs/latex/uni.bib<CR>

	" Code snippets
			autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
			autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
			autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
			autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
			autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
			autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
			autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
			autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
			autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
			autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
			autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
			autocmd FileType tex inoremap ,li <Enter>\item<Space>
			autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
			autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
			autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
			autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
			autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
			autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
			autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
			autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
			autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
			autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
			autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
			autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
			autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
			autocmd FileType tex inoremap ,bt {\blindtext}
			autocmd FileType tex inoremap ,nu $\varnothing$
			autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
			autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
""}}}


""set spell
set wildmode=longest,list,full
set dictionary=dict
"
""File handling
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>ff :e 
nnoremap <leader>fed :e ~/.vimrc<CR>
"
""Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

""Change tabs
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
"
""shift pgup pgdown for end and home
nnoremap <S-pageup>   <home>
nnoremap <S-pagedown> <end>
inoremap <pageup>     <home>
inoremap <pagedown>   <end>

"c remap ctrl-a home ctrl-e end
cnoremap <C-a> <home>
cnoremap <C-e> <end>


"CLOSETAGS PLUGIN
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
let g:user_emmet_expandabbr_key='<Tab>'
inoremap <tab> emmet#expandAbbrIntelligent("\<tab>")


"NEOBUNDLE

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'https://github.com/xuhdev/vim-latex-live-preview'
NeoBundle 'https://github.com/ying17zi/vim-live-latex-preview'
NeoBundle 'https://github.com/maxbrunsfeld/vim-yankstack'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'https://github.com/suan/vim-instant-markdown'
NeoBundle 'https://github.com/ap/vim-css-color'
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides'
NeoBundle 'https://github.com/scrooloose/nerdtree'
NeoBundle 'https://github.com/ervandew/supertab'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'https://github.com/vim-scripts/Emmet.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'othree/html5.vim'
NeoBundle 'https://github.com/wincent/command-t'
NeoBundle 'https://github.com/tpope/vim-repeat'
NeoBundle 'ctrlpvim/ctrlp.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
