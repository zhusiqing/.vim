set rtp+=~/.vim/plugged/vim-auto-plug
call plug#begin('~/.vim/plugged')

Plug 'vimx/vim-auto-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-dirvish'
Plug 'othree/html5.vim'
Plug 'cesardeazevedo/Fx-ColorScheme'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --tern-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
  let g:ycm_min_num_of_chars_for_completion = 2
  let g:ycm_auto_trigger = 1
  let g:ycm_always_populate_location_list = 1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'CodeFalling/fcitx-vim-osx'

Plug 'rizzatti/dash.vim'

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


if has("gui_macvim")
  set macligatures
endif

" fix for `crontab -e`
set backupskip=/tmp/*,/private/tmp/*

" set up file type detection
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
