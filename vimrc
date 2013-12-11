set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'farseer90718/vim-taskwarrior'

Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-capslock'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-pastie'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-scriptease'

Bundle 'Yggdroot/indentLine'

Bundle 'jelera/vim-javascript-syntax'
Bundle 'Pychimp/vim-luna'
Bundle 'briancarper/gentooish.vim'

Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_keys='abcdefghijklmnopqrstuvwxyz1234567890'
  let g:EasyMotion_mapping_f = 'f'
  let g:EasyMotion_mapping_F = 'F'

Bundle 'vimwiki'
  let g:vimwiki_list=[{'path': '~/vimwiki', 'path_html': '~/vimwiki/html'}]
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'bkad/CamelCaseMotion'

Bundle 'othree/html5-syntax.vim'
Bundle 'othree/eregex.vim'
Bundle 'othree/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'leshill/vim-json'
Bundle 'goatslacker/mango.vim'

Bundle 'bling/vim-airline'
  let g:airline_powerline_fonts=1
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/ctrlp.vim'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/][\.(git|hg|svn|cache)|dist]',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'ag %s -l --nocolor --hidden -g ""'
    \ }

Bundle 'sgur/ctrlp-extensions.vim'
  let g:ctrlp_extensions = ['yankring', 'cmdline']
Bundle 'vimx/YankRing.vim'

Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'edsono/vim-matchit'
Bundle 'ujihisa/neco-look'

Bundle 'rking/ag.vim'

Bundle 'Shougo/neocomplete.vim'
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
Bundle 'Shougo/neosnippet'
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  let g:neosnippet#enable_snipmate_compatibility=1
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/'

Bundle "honza/vim-snippets"

Bundle 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<Enter>

Bundle 'mhinz/vim-signify'

Bundle 'stephpy/vim-yaml'

Bundle 'digitaltoad/vim-jade'
    au Filetype jade setlocal ts=2 sts=2 sw=2
    au Filetype javascript setlocal ts=2 sts=2 shiftwidth=2
Bundle 'wavded/vim-stylus'
    au Filetype stylus setlocal ts=2 sts=2 sw=2

let mapleader=","
nnoremap ; :
vmap Q gq
set fileencodings=utf-8 nobomb

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

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
  map <D-1> :tabn 1
  map <D-2> :tabn 2
endif

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

if has('gui_running')
  colorscheme luna
else
  colorscheme luna-term
endif

set guifont=Source\ Code\ Pro\ for\ Powerline:h14

cd /Users/zy/Projects/