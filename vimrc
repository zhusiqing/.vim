set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'sjl/gundo.vim'

Bundle 'dyng/ctrlsf.vim'
Bundle 'jayflo/vim-skip'
Bundle 'reedes/vim-colors-pencil'

Bundle 'majutsushi/tagbar'
Bundle 'vimx/ColorSamplerPack'

Bundle 'altercation/vim-colors-solarized'
Bundle 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'component': {
          \ 'readonly': '%{&readonly?"x":""}',
        \ },
        \ 'separator': { 'left': '', 'right': ''},
        \ 'subsepartor': { 'left': '|', 'right': '|'}
        \}


Bundle 'ervandew/supertab'
  let g:SuperTabSetDefaultCompletionType="context"
  let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
  let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
  let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

Bundle 'itchyny/calendar.vim'
  let g:calendar_frame='unicode'
  let g:calendar_google_calendar=1
  let g:calendar_google_task=1
  let g:calendar_first_day='sunday'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'

Bundle 'kchmck/vim-coffee-script'

Bundle 'briancarper/gentooish.vim'

Bundle 'othree/html5-syntax.vim'
  let g:html_indent_script1 = "inc"
  let g:html_indent_style1 = "inc"
  let g:html_indent_inctags = "html,body,head,tbody"
Bundle 'othree/eregex.vim'
  nnoremap / :M/
  nnoremap ? :M?
Bundle 'othree/vim-javascript-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'leshill/vim-json'

Bundle 'kien/ctrlp.vim'
  let g:ctrlp_map='<C-p>'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_max_depth=10
  let g:ctrlp_max_file=500
  let g:ctrlp_max_history=&history
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

Bundle 'edsono/vim-matchit'

Bundle 'rking/ag.vim'

Bundle 'editorconfig/editorconfig-vim'

Bundle 'thinkpixellab/flatland', {"rtp": "Vim/"}
Bundle 'w0ng/vim-hybrid'
Bundle 'daylerees/colour-schemes', {"rtp": "vim-themes/"}

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

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
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

set hlsearch
set incsearch
set ignorecase

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

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme pencil

set guifont=Consolas:h12

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nnoremap gl :set operatorfunc=GoogleOperator<cr>g@
vnoremap gl :<c-u>call GoogleOperator(visualmode())<cr>
 
function! GoogleOperator(type)
  let saved_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  silent execute "! open " . shellescape("https://www.google.com/search?q=" . @@)
  let @@ = saved_register
  redraw!
endfunction


function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()