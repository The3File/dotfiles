call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
call plug#end()

syntax enable

filetype plugin indent on
filetype plugin on


set number
set relativenumber
colorscheme default


inoremap <C-j> <ESC>/<++><Enter>"_c4l
nnoremap <C-j> <ESC>/<++><Enter>"_c4l
nnoremap gf :G<ENTER>:silent !{i3-msg fullscreen toggle}<ENTER>

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"#####################################"
"###### 	 Latex		######"
"#####################################"

"NORMAL		#--------------------------------#

autocmd FileType tex nnoremap ;S i\section{}<ENTER><ENTER><++><ESC>2kf}i

autocmd FileType tex nnoremap ;s i\subsection{}<ENTER><ENTER><++><ESC>2kf}i

autocmd FileType tex inoremap ;i <ESC>o\item<Space>

autocmd FileType tex nnoremap ;i <ESC>\item<Space>

autocmd FileType tex nnoremap ;b i\begin{}<Enter>\end{}<ESC>kf}i

"autocmd FileType tex nnoremap ;e i\begin{enumerate}[label=\alph*.]<Enter>\end{enumerate}<ESC>kf}i

autocmd FileType tex nnoremap ;e i\begin{enumerate}[label=<++>]<Enter>\end{enumerate}<ESC>O\item 

autocmd FileType tex inoremap ;r \ref{}<++><ESC>T{i

"MATH		#--------------------------------#

autocmd FileType tex inoremap ;m \[\]<ESC>hi

autocmd FileType tex inoremap $$ $$<++><ESC>F$i

autocmd FileType tex inoremap ;e \begin{equation}<ESC>o\end{equation}<ESC>O\label{eq:<++>}<ESC>o

autocmd FileType tex inoremap ;E \begin{align}<ESC>o\end{align}<ESC>O\label{eq:<++>}<ESC>o

autocmd FileType tex inoremap ;e \begin{align*}<ESC>o\end{align*}<ESC>O

autocmd FileType tex inoremap ;t \times

autocmd FileType tex inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i

autocmd FileType tex inoremap ;s \sqrt{}<++><ESC>Ftf}i

"GNUPLOT	#--------------------------------#

autocmd FileType tex nnoremap ;g i\begin{figure}[h!]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<ENTER>\begin{gnuplot}[terminal=epslatex]<ENTER><++><ENTER>\end{gnuplot}<ENTER>\end{gnuplot}<ESC>5k/<+*+><Enter>"_c4l

"######### MARKDOWN ###########"

autocmd FileType markdown inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i
autocmd FileType markdown inoremap ;t \times
autocmd FileType markdown inoremap ;s \sqrt{}<++><ESC>Ftf}i

"#####################################"
"#####		Plugins		 #####"
"#####################################"

"VimTex

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
 	\ 'comments' : {},
	\}

"NeoVim Airline

let g:airline_theme='fairyfloss'
let g:airline_powerline_fonts = 1

"Goyo

let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = -20


"LimeLight

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_priority = -1
let g:limelight_default_coefficient = 0.7

"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

""""
set grepprg=grep\ -nH\ $*
