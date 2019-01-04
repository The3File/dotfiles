call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'dylanaraps/wal.vim'
Plug 'gioele/vim-autoswap'
call plug#end()

syntax enable

filetype plugin indent on
filetype plugin on

set number
set relativenumber

set smartindent
set autoindent
set shiftwidth=3

colorscheme wal

set clipboard=unnamedplus
set nohlsearch

inoremap <C-Space> <ESC>/<++><Enter>"_c4l
nnoremap <C-Space> <ESC>/<++><Enter>"_c4l
nnoremap gf :G<ENTER>:silent !{i3-msg fullscreen toggle}<ENTER>

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"#####################################"
"###### 	 Latex		######"
"#####################################"

"NORMAL		#--------------------------------#

autocmd FileType tex nnoremap mp :w<ENTER>:! pdflatex -shell-escape %<CR><CR>

autocmd FileType tex nnoremap mo :! texopenpdf %<CR><CR>

autocmd FileType tex nnoremap ;S i\section{}<ENTER><ENTER><++><ESC>2kf}i

autocmd FileType tex nnoremap ;s i\subsection{}<ENTER><ENTER><++><ESC>2kf}i

autocmd FileType tex inoremap ;i <ESC>o\item<Space>

autocmd FileType tex nnoremap ;i <ESC>\item<Space>

autocmd FileType tex nnoremap ;b i\begin{}<Enter>\end{}<ESC>kf}i

autocmd FileType tex nnoremap ;e i\begin{enumerate}<Enter>\item <++><ENTER>\end{enumerate}<ESC>2k0f=a

autocmd FileType tex nnoremap ;a i\begin{enumerate}[label=\textbf{\alph*)}]<Enter>\end{enumerate}<ESC>O\item 

autocmd FileType tex nnoremap ;t i\begin{table}[h]<Enter>\centering<Enter>\begin{tabular}{}<Enter>\end{tabular}<Enter>\end{table}<ESC>

autocmd FileType tex inoremap ;r \ref{}<++><ESC>T{i

"MATH		#--------------------------------#

autocmd FileType tex inoremap ;m \[\]<ESC>hi

autocmd FileType tex inoremap $$ $$<++><ESC>F$i

autocmd FileType tex inoremap __ _{}<++><ESC>F}i

autocmd FileType tex inoremap ;e \begin{equation}<ESC>o\end{equation}<ESC>O\label{eq:<++>}<ESC>o

autocmd FileType tex inoremap ;E \begin{align}<ESC>o\end{align}<ESC>O\label{eq:<++>}<ESC>o

autocmd FileType tex inoremap ;a \begin{align*}<ESC>o\end{align*}<ESC>O

autocmd FileType tex inoremap ;t \times

autocmd FileType tex inoremap ;d \div

autocmd FileType tex inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i

autocmd FileType tex inoremap ;s \sqrt{}<++><ESC>Ftf}i

"GNUPLOT	#--------------------------------#

autocmd FileType tex nnoremap ;g i\begin{figure}[h!]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<ENTER>\begin{gnuplot}[terminal=epslatex]<ENTER><++><ENTER>\end{gnuplot}<ENTER>\end{figure}<ESC>5k/<+*+><Enter>"_c4l

"######### MARKDOWN ###########"

autocmd FileType markdown inoremap ;m $$$$<++><ESC>5hi
autocmd FileType markdown inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i
autocmd FileType markdown inoremap ;t \times
autocmd FileType markdown inoremap ;s \sqrt{}<++><ESC>Ftf}i
autocmd FileType markdown inoremap $$ $$<++><ESC>F$i
autocmd FileType markdown nnoremap mo :w<CR>:! mdtopdf open %<CR><CR>
autocmd FileType markdown nnoremap mp :w<CR>:! mdtopdf %<CR><CR>
autocmd FileType markdown nnoremap md :w<CR>:! mdtodoc %<CR><CR>

"#####################################"
"#####		Plugins		 #####"
"#####################################"

"NERDtree
" Guess
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" If vim starts without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" If vim starts with a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

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

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

set title titlestring=

""""
set grepprg=grep\ -nH\ $*
