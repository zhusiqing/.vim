set rtp+=~/.vim/plugged/vim-auto-plug

let python_host_prog = "python3"

call plug#begin('~/.vim/plugged')

Plug 'vimx/vim-auto-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-dirvish'
Plug 'othree/html5.vim'
Plug 'wincent/loupe'
Plug 'posva/vim-vue'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'FooSoft/vim-argwrap'
  nnoremap <silent> <leader>a :ArgWrap<cr>
Plug 'mileszs/ack.vim'
  let g:ackprg='ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack

Plug 'kshenoy/vim-signature'
Plug 'scrooloose/syntastic'
  let g:syntastic_javascript_checkers = ["eslint"]
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'dracula/vim'
Plug 'isRuslan/vim-es6'

Plug 'kana/vim-textobj-user'
Plug 'poetic/vim-textobj-javascript'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neopairs.vim'

Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-grammarous'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-clojure-static'

Plug 'reedes/vim-colors-pencil'

Plug 'vim-jp/vital.vim'

Plug '~/Projects/colorful.vim'

Plug 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
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

set clipboard=unnamed
set autoread
set backupskip=/tmp/*,/private/tmp/* " fix for `crontab -e`
set completeopt-=preview
set cursorline
set expandtab
set guifont=FiraCode-Regular:h12
set hlsearch
set ignorecase
set lazyredraw
set magic
set mouse=a
set nobackup
set noswapfile
set number
set shiftwidth=2
set shiftwidth=2
set smartcase
set so=7
set sts=2
set ts=2
set undodir=~/.vim/undodir
set undofile
set undolevels=100000
set undoreload=100000
set whichwrap+=<,>,h,l,[,]
set wrap
nnoremap gb :ls<CR>:b
nnoremap <space> za
" Make space more useful
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" set up file type detection
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.tag setlocal filetype=javascript

function! s:nice_next(cmd)
  let view = winsaveview()
  execute "normal! " . a:cmd
  if view.topline != winsaveview().topline
    normal! zz
  endif
endfunction

nnoremap <silent> n :call <SID>nice_next('n')<cr>
nnoremap <silent> N :call <SID>nice_next('N')<cr>


syntax on
set background=dark
colorscheme pencil
