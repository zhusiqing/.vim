call plug#begin()

Plug 'junegunn/vim-plug'

Plug 'tpope/vim-sensible'

Plug "MarcWeber/vim-addon-mw-utils"
Plug "tomtom/tlib_vim"
Plug "garbas/vim-snipmate"

Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_leader_key='<Leader>'

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
  source ~/.vim/neocompleterc

Plug 'daylerees/colour-schemes', {'rtp': 'vim-themes'} 
Plug 'godlygeek/csapprox'
Plug 'junegunn/vim-easy-align'

Plug 'kien/ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'

Plug 'oblitum/rainbow'
  let g:rainbow_active=1

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'

Plug 'rhysd/clever-f.vim'
Plug 'tomtom/tcomment_vim'

Plug 'sjl/gundo.vim'


Plug 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
    au Filetype javascript setlocal ts=2 sts=2 shiftwidth=2
Plug 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2

Plug 'zhuangya/YankRing.vim'

call plug#end()

let mapleader=","
nnoremap ; :
vmap Q gq
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

syntax enable
set smartcase
set ignorecase
set whichwrap+=<,>,h,l,[,]
set showcmd
set guifont=Source\ Code\ Pro:h12

set undofile
set undodir=~/.vim/undodir
set undolevels=10000
set undoreload=100000

set hlsearch
set incsearch
set ignorecase

set confirm
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2

set ruler
set autoindent
set copyindent
set cindent
set smartindent

set showmatch

set wrap
set magic
set laststatus=2
set autoread

set title

colorscheme Patriot

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python ,JavaScript and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

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
filetype plugin indent on
set number
set rnu

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
