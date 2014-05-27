set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'


Bundle 'sjl/gundo.vim'
Bundle 'reedes/vim-colors-pencil'
Bundle 'junegunn/vim-fnr'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'elzr/vim-json'
Bundle 'wellle/targets.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'drmingdrmer/xptemplate'
Bundle 'fatih/vim-go'
  au FileType go nmap <Leader>i <Plug>(go-import)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

Bundle 'mhallendal/spacedust-theme', {"rtp": "Vim/"}

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

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
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
    return neocomplete#close_popup() . "\<CR>"
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

Bundle 'gcmt/wildfire.vim'

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
Bundle 'tpope/vim-ragtag'

Bundle 'mhinz/vim-startify'
    let g:startify_custom_header = [
                \'        ᕙ(`▽´)ᕗ  ٩(^‿^)۶',
                \'',
                \'',
                \ ]

Bundle 'kchmck/vim-coffee-script'

Bundle 'othree/html5.vim'
Bundle "ekalinin/Dockerfile.vim"

Bundle 'pangloss/vim-javascript'
  let g:javascript_conceal=1
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
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

colorscheme Spacedust
set background=dark

set guifont=Source\ Code\ Pro\ for\ Powerline:h16
