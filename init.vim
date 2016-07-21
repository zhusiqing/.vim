let python_host_prog = "python3"

" DEPRECATED:
" source $HOME/.vim/vim-plug-setup.vim

source $HOME/.vim/plugins.dein.vim

set autoread
set background=dark
set backupskip=/tmp/*,/private/tmp/* " fix for `crontab -e`
set clipboard=unnamed
set completeopt-=preview
set expandtab
set hlsearch
set ignorecase
set lazyredraw
set magic
set mouse=a
set nobackup
set noswapfile
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set undolevels=100000
set undoreload=100000
set whichwrap+=<,>,h,l,[,]
set wrap

nnoremap gb :ls<CR>:b
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.tag setlocal filetype=javascript

syntax on
