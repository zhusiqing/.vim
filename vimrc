set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'sjl/gundo.vim'
Bundle 'reedes/vim-colors-pencil'
Bundle 'Valloric/YouCompleteMe'

Bundle 'bling/vim-airline'
  let g:airline_powerline_fonts = 1

Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  " Bi-directional find motion
  " Jump to anywhere you want with minimal keystrokes, with just one key binding.
  " `s{char}{label}`
  " nmap s <Plug>(easymotion-s)
  " or
  " `s{char}{char}{label}`
  " Need one more keystroke, but on average, it may be more comfortable.
  nmap s <Plug>(easymotion-s2)

  " Turn on case sensitive feature
  let g:EasyMotion_smartcase = 1

  " JK motions: Line motions
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  map <Leader>b <Plug>(easymotion-b)
  map <Leader>w <Plug>(easymotion-w)
  map <Leader>e <Plug>(easymotion-e)


Bundle 'gcmt/wildfire.vim'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-ragtag'

Bundle 'tomasr/molokai'

Bundle 'mustache/vim-mustache-handlebars'

Bundle 'mhinz/vim-startify'
    let g:startify_custom_header = [
                \'        ᕙ(`▽´)ᕗ  ٩(^‿^)۶',
                \'',
                \'',
                \ ]

Bundle 'kchmck/vim-coffee-script'

Bundle 'othree/html5-syntax.vim'
  let g:html_indent_script1 = "inc"
  let g:html_indent_style1 = "inc"
  let g:html_indent_inctags = "html,body,head,tbody"
Bundle 'othree/vim-javascript-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'leshill/vim-json'
Bundle 'ntpeters/vim-better-whitespace'

Bundle 'kien/ctrlp.vim'
  let g:ctrlp_map='<C-p>'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_max_depth=10
  let g:ctrlp_max_file=500
  let g:ctrlp_max_history=&history
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

Bundle 'edsono/vim-matchit'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'thinkpixellab/flatland', {"rtp": "Vim/"}

Bundle 'stephpy/vim-yaml'

Bundle 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
Bundle 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2

au Filetype javascript setlocal ts=4 sts=4 shiftwidth=4

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

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
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

colorscheme pencil
set background=light

set guifont=Source\ Code\ Pro\ for\ Powerline:h16