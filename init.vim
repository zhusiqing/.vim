let python_host_prog = "python3"

source $HOME/.vim/plugins.dein.vim

set autoread
set background=light
set backupcopy=yes
set backupskip=/tmp/*,/private/tmp/* " fix for `crontab -e`
set clipboard=unnamed
set completeopt-=preview
set cursorline
set expandtab
set exrc
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
set secure
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
set wildignore+=*node_modules*
set wildmenu
set wildmode=longest:full,list:full
set wrap

nnoremap gb :ls<CR>:b
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3 / 2)<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 2 / 3)<CR>

autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd FileType javascript setlocal suffixesadd+=.js path+=$PWD/node_modules
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

syntax on

colorscheme ayu

source $HOME/.vim/custom.vim
