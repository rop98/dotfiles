
""{{{,fOR LATEX
	" compile latex, markdown, etc
  	map <leader>c :!compiler <space> "%"<CR>
	" Word count:
		autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
		autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Open my bibliography file in split
		map <F9> :vsp<space>~/docs/latex/uni.bib<CR>
		map <leader>b :tabedit<space>~/docs/latex/uni.bib<CR>
		map <leader>B :vsp<space>~/docs/latex/uni.bib<CR>
	" Runs a script that cleans out tex build files after exit .tex file.
		autocmd VimLeave *.tex !texclear %
	" Open corresponding.pdf
	  map <leader>P :silent update<Bar>silent !llpp.inotify %:p &<CR><CR>
	


	"Latex Code snippets
			autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
			autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
			autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
			autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
      "text formatting
			autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
			autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
			autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
			autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
			autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
      "Justification
			autocmd FileType tex inoremap ,ce \begin{center}<Enter><Enter>\end{center}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,fl \begin{flushleft}<Enter><Enter>\end{flushleft}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex inoremap ,fr \begin{flushright}<Enter><Enter>\end{flushright}<Enter><Enter><++><Esc>3kA
			autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
			autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
			autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
      "bibliography
			autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
			autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
			autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
			autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
			autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
      "lists
			autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
			autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
			autocmd FileType tex inoremap ,li <Enter>\item<Space>
			autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
			autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
			autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
			autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
      "sectioning
			autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
			autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
      "misc
			autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
			autocmd FileType tex inoremap ,bt {\blindtext}
			autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
			autocmd FileType tex inoremap ,nu $\varnothing$
			autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
			autocmd FileType tex inoremap ,nc newcommand{\}{}<Esc>ji<++><Esc>kF}F}i
""}}}

""".bib
	autocmd FileType bib inoremap ,a @article{<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>address<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>7kA,<Esc>i
	autocmd FileType bib inoremap ,o @online{<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>url<Space>=<Space>"<++>",<Enter><tab>urldate<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>7kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
	"for web too
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
