
"{{{,CODING SPECIFIC
"------------------------
autocmd BufEnter * silent! lcd %:p:h
set lazyredraw
set ttyfast
set pastetoggle=<F2>
set number
set relativenumber 
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks
let python_higlight_all = 1
let g:vim_indent_cont = 0										" No magic shifts on Vim line continuations
"let g:indent_guides_enable_on_vim_startup=1
set colorcolumn=100
set cursorline
syntax on
syntax enable
set showmatch
set ruler
set nowrap
set incsearch
set hlsearch
set smartcase
set lbr
""}}}
""
""{{{,TABS
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
""}}}
""
""{{{,"FOLDS
set foldenable
set ignorecase
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker "indent
nnoremap <leader>ifs i%#""{{{,
nnoremap <leader>ife i%#""}}}
""}}}
""
""{{{, Etc
nnoremap <F5> :silent update<Bar>silent !chromium %:p &<CR>
inoremap <F5> :silent update<Bar>silent !chromium %:p &<CR>
nnoremap <F10> :exe ':silent !chromium %'<CR>
nnoremap <F11> :Goyo<CR>
filetype plugin indent on
filetype plugin on
"""}}}
""
""{{{, GENERAL
colorscheme afterglow
"colorscheme murphy
"colorscheme koehler 
set clipboard=unnamed
set clipboard+=unnamed
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
nnoremap Y y$
" Tab navigation like Firefox.
nnoremap <C-S-n> :tabprevious<CR>
nnoremap <C-n>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
"line break and wrap
nnoremap <leader>l :set wrap!<CR>
"word count with f3
map <F3> :!wc <C-R>%<CR>
" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l
""}}}
"fzf fast
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bl :BLines<Space> 
nnoremap <leader>al :Lines<Space> 
""set spell
set wildmode=longest,list,full
set dictionary=dict
map <F6> :setlocal spell! spelllang=en_gb<CR>
"configuring common
nnoremap <leader>fec :e ~/.config/script/vimsnip/

""Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <leader>vs :vsplit
nnoremap <leader>hs :split

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

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

"CLOSETAGS PLUGIN
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
"let g:user_emmet_expandabbr_key='<Tab>'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <tab> :emmet#expandAbbrIntelligent("\<tab>")

"vimwiki 
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" set markdown syntax highlighting for .md files
au BufRead,BufNewFile *.md set ft=markdown
" consider Jekyll YAML to be a comment
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
" syntax highlighting for <pre><code> in markdown
let g:markdown_fenced_languages = ['ruby', 'elixir', 'sh', 'yaml', 'javascript', 'html', 'coffee', 'elm']


"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
