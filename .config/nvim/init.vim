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
filetype indent on
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

" GNUPLOT

autocmd FileType tex nnoremap ;g i\begin{figure}[h!]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<ENTER>\begin{gnuplot}[terminal=epslatex]<ENTER><++><ENTER>\end{gnuplot}<ENTER>\end{figure}<ESC>5k/<+*+><Enter>"_c4l

"" MARKDOWN

autocmd FileType markdown inoremap ;m $$$$<++><ESC>5hi
autocmd FileType markdown inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i
autocmd FileType markdown inoremap ;t \times
autocmd FileType markdown inoremap ;s \sqrt{}<++><ESC>Ftf}i
autocmd FileType markdown inoremap $$ $$<++><ESC>F$i
autocmd FileType markdown nnoremap mo :w<CR>:! mdtopdf open %<CR><CR>
autocmd FileType markdown nnoremap mp :w<CR>:! mdtopdf %<CR><CR>
autocmd FileType markdown nnoremap md :w<CR>:! mdtodoc %<CR><CR>

"" HTML
autocmd FileType html inoremap ;html <!DOCTYPE html><ENTER><html><ENTER><head><ENTER><title><++></title><ENTER></head><ENTER><body><ENTER><++><ENTER></body><ENTER></html><ESC>gg
autocmd FileType html inoremap ;ln <link rel="stylesheet" type="text/css" href=""><ESC>hi
autocmd FileType html inoremap ;id <div id=""><++></div><ESC>F"i
autocmd FileType html inoremap ;cl <div class=""><++></div><ESC>F"i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;it <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType html inoremap ;td <td></td><++><Esc>Fdcit
autocmd FileType html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType html inoremap ;th <th></th><++><Esc>Fhcit
autocmd FileType html inoremap ;tab <table><Enter></table><Esc>O
autocmd FileType html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc

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

nnoremap gf :G<ENTER>:!bspc node -t fullscreen<CR><CR>
nnoremap g<ESC> :G<CR>:!bspc node -t tiled<CR><CR>

let g:goyo_width = 100
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0

"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

"LimeLight

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_priority = -1
let g:limelight_default_coefficient = 0.7

set title titlestring=hej

""""
set grepprg=grep\ -nH\ $*
