set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

Bundle 'wellle/targets.vim'
Bundle 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
Bundle 'kchmck/vim-coffee-script'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'sjl/gundo.vim'

Bundle 'noahfrederick/vim-hemisu'
Bundle 'nanotech/jellybeans.vim'
Bundle 'gcmt/wildfire.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'

Bundle 'gorodinskiy/vim-coloresque'

Bundle 'kien/ctrlp.vim'
  let g:ctrlp_map='<C-p>'
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_max_depth=10
  let g:ctrlp_max_file=500
  let g:ctrlp_max_history=&history
  let g:ctrlp_user_command = {
          \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
          \ 'fallback': 'ag %s -l --nocolor --hidden -g ""',
        \ }
  let g:ctrlp_custom_ignore = {
          \ 'dir': '\v[\/]\.(git|hg|svg)$',
          \ 'file': '\v\.(exe|so|dll)$'
        \ }

Bundle 'editorconfig/editorconfig-vim'

Bundle 'stephpy/vim-yaml'

Bundle 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
    au Filetype javascript setlocal ts=2 sts=2 shiftwidth=2
Bundle 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2

vmap Q gq
set fileencodings=utf-8 nobomb

set autoread

set binary
set noeol

set exrc
set secure

set list

filetype plugin indent on

syntax enable
set smartcase
set ignorecase
set whichwrap+=<,>,h,l,[,]
set showcmd

set undofile
set undodir=~/.vim/undodir
set history=100
set undolevels=100
set undoreload=100

set ttyfast

set hlsearch
set incsearch
set ignorecase

if has('gui_running')
  set guioptions-=Tm
  set guioptions-=r
end

set confirm
set expandtab
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2

set ruler
set autoindent
set cindent
set smartindent

set matchpairs+=<:>
set showmatch
set matchtime=3

set wrap
set magic
set laststatus=2
set autoread

autocmd! bufwritepost vimrc source $MYVIMRC
set title

set wildmenu
set t_Co=256
set noswapfile
set nobackup
set nowb
set smarttab
set backspace=indent,eol,start
set cursorline
set noerrorbells
set novisualbell
set mouse=a
set t_vb=
set tm=500
set number
set lazyredraw
set background=dark
colorscheme jellybeans
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

if exists('+colorcolumn')
  set colorcolumn=80
endif