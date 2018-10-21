execute pathogen#infect()
syntax on
filetype plugin indent on

set foldmethod=syntax

inoremap <Space><Space> <ESC>/<++><Enter>"_c4l
nnoremap <Space><Space> <ESC>/<++><Enter>"_c4l

"###### 	 Latex		######"

autocmd FileType tex nnoremap ;s i\section{}<ESC>i



autocmd FileType tex inoremap ;i <ESC>o\item<Space>

autocmd FileType tex nnoremap ;i <ESC>\item<Space>

autocmd FileType tex nnoremap ;b i\begin{}<Enter>\end{}<ESC>kf}i

autocmd FileType tex nnoremap ;ab i\begin{}[label=\alph*.]<Enter>\end{}<ESC>kf}i

autocmd FileType tex nnoremap ;lb i\begin{}[label=<++>]<Enter>\end{}<ESC>kf}i

autocmd FileType tex inoremap ;b <ESC>j.O 

"MATH

autocmd FileType tex inoremap ;m $$<ESC>i

autocmd FileType tex inoremap ;t \times

autocmd FileType tex inoremap ;f \frac{}{<++>}<++><ESC>Fcf}i

autocmd FileType tex inoremap ;s \sqrt{}<ESC>Ftf}i

"#####################################"
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

