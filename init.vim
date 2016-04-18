set rtp+=~/.vim/plugged/vim-auto-plug
call plug#begin('~/.vim/plugged')

Plug 'vimx/vim-auto-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-dirvish'
Plug 'othree/html5.vim'
Plug 'cesardeazevedo/Fx-ColorScheme'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/context_filetype.vim'

Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-clojure-static'

Plug 'vim-jp/vital.vim'

Plug 'skammer/vim-css-color'
Plug '~/Projects/colorful.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'CodeFalling/fcitx-vim-osx'

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_use_caching = 1
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_cache_dir = '$HOME/.vim/cache/ctrlp'
  let g:ctrlp_max_files = 1000
  let g:ctrlp_max_depth = 20
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'fire': '\v\.(exe|so|dll)$',
  \ }
  let g:ctrlp_user_command = [
        \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
        \ 'find %s -type f'
        \ ]
  let g:ctrlp_working_path_mode = 'ra'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

Plug 'chrisbra/vim-diff-enhanced'

call plug#end()
filetype plugin indent on    " required

syntax on
set background=dark
colorscheme fx
set nu
set sts=2
set ts=2
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set so=7
set number
set mouse=a
set nocursorline
set expandtab
set undofile
set undodir=~/.vim/undodir
set undolevels=100000
set undoreload=100000
set ttyfast
set smartcase
set ignorecase
set whichwrap+=<,>,h,l,[,]
set wrap
set magic
set lazyredraw
set autoread
set ttyfast
set t_Co=256
set completeopt-=preview
set nobackup
set noswapfile
nnoremap gb :ls<CR>:b
set background=dark
set guifont=FiraCode-Regular:h12
" Make space more useful
nnoremap <space> za

" if has("gui_macvim")
"   set macligatures
" endif

" fix for `crontab -e`
set backupskip=/tmp/*,/private/tmp/*

" set up file type detection
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

autocmd BufNewFile,BufRead *.tag setlocal filetype=javascript
