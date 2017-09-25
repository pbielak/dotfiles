set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call plug#end()
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix

" Encoding
set encoding=utf-8

" Color schemes
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" Enable line numbering
set nu

let python_highlight_all=1
syntax on
