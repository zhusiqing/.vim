call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
Plug 'wellle/targets.vim'

Plug 'ervandew/supertab'
Plug 'drmingdrmer/xptemplate'
  let g:xptemplate_key='<Tab>'
Plug 'vimx/YankRing.vim'
  let g:yankring_replace_n_pkey = '<C-j>'
  let g:yankring_replace_n_nkey = '<C-k>'
Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 0
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-git'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'ntpeters/vim-better-whitespace'
  autocmd FileType js,css,html,jsp,cshtml autocmd BufWritePre <buffer> StripWhitespace
Plug 'kien/ctrlp.vim'
  let g:ctrlp_map='<C-p>'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_max_depth=10
  let g:ctrlp_max_file=500
  let g:ctrlp_max_history=&history
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

Plug 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
Plug 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2


Plug 'mhinz/vim-startify'
    let g:startify_custom_header = [
                \'        ᕙ(`▽´)ᕗ  ٩(^‿^)۶',
                \'',
                \'',
                \ ]



call plug#end()

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
