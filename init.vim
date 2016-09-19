let python_host_prog = "python3"

" DEPRECATED:
" source $HOME/.vim/vim-plug-setup.vim

source $HOME/.vim/plugins.dein.vim

set autoread
set background=dark
set backupcopy=yes
set backupskip=/tmp/*,/private/tmp/* " fix for `crontab -e`
set clipboard=unnamed
set completeopt-=preview
set expandtab
set hlsearch
set ignorecase
set lazyredraw
set linebreak
set magic
set matchtime=2
set mouse=a
set nobackup
set noswapfile
set nrformats+=alpha
set number
set shiftround
set shiftwidth=2
set showmatch
set smartcase
set softtabstop=2
set tabstop=2
set termguicolors
set undodir=~/.vim/undodir
set undofile
set undolevels=100000
set undoreload=100000
set whichwrap+=<,>,h,l,[,]
set wildignore+=*.a,*.o,*.so,*.pyc,*.class
set wildignore+=*.bak,*.swp,*.swo
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
set wildignore+=*/.git*,*.tar,*.zip
set wildmenu
set wildmode=longest:full,list:full
set wrap
set cursorline

nnoremap gb :ls<CR>:b
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3 / 2)<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 2 / 3)<CR>

autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.tag setlocal filetype=javascript
autocmd FileType javascript setlocal suffixesadd+=.js path+=$PWD/node_modules
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

syntax on

colorscheme deep-space

source $HOME/.vim/custom.vim
