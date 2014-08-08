set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fireplace'
Plugin 'junegunn/goyo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/csapprox'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Pychimp/vim-sol'
Plugin 'bling/vim-airline'
  let g:airline_powerline_fonts=1
call vundle#end()
filetype plugin indent on
set t_Co=256
colorscheme sol
set hlsearch
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set mouse=a
set cursorline
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set guifontwide=Noto\ Sans\ S\ Chinese\ Regular:h14
let g:html_indent_tag='li\|p'
set splitbelow
set splitright
set expandtab

set undofile
set undodir=~/.vim/undodir
set undolevels=100000
set undoreload=100000

set ttyfast
if has('gui_running')
  set guioptions-=Tm
  set guioptions-=r
end
set smartcase
set ignorecase
set whichwrap+=<,>,h,l,[,]
set wrap
set magic
set lazyredraw

