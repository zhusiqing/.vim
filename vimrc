set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/vim-easy-align'
  vmap <Enter> <Plugin>(EasyAlign)
Plugin 'wellle/targets.vim'

Plugin 'ervandew/supertab'
Plugin 'Shougo/vimproc.vim'
Plugin 'idanarye/vim-merginal'
Plugin 'vimx/YankRing.vim'
  let g:yankring_replace_n_pkey = '<C-j>'
  let g:yankring_replace_n_nkey = '<C-k>'
Plugin 'bling/vim-airline'
  let g:airline_powerline_fonts = 0
Plugin 'zhuangya/vim-csharp'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-ragtag'
Plugin 'ntpeters/vim-better-whitespace'
  autocmd FileType js,css,html,jsp,cshtml autocmd BufWritePre <buffer> StripWhitespace
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_map='<C-p>'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_max_depth=10
  let g:ctrlp_max_file=500
  let g:ctrlp_max_history=&history
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

Plugin 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
Plugin 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2


Plugin 'mhinz/vim-startify'
    let g:startify_custom_header = [
                \'        ᕙ(`▽´)ᕗ  ٩(^‿^)۶',
                \'',
                \'',
                \ ]

call vundle#end()

colorscheme seoul256
set fileencodings=utf-8 nobomb

set secure

set list
syntax enable
set smartcase
set ignorecase
set whichwrap+=<,>,h,l,[,]

set undofile
set undodir=~/.vim/undodir
set undolevels=100000
set undoreload=100000

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
set tabstop=2
set shiftwidth=2
set softtabstop=2

set cindent
set smartindent

set matchpairs+=<:>
set showmatch
set matchtime=3

set wrap
set magic

autocmd! bufwritepost vimrc source $MYVIMRC
set title

set t_Co=256
set noswapfile
set nobackup
set nowb
set cursorline
set noerrorbells
set novisualbell
set mouse=a
set t_vb=
set tm=500
set number
set lazyredraw

set guifont=Source\ Code\ Pro\ for\ Powerline:h16
