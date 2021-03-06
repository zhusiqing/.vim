let python_host_prog = "/Users/nos/.pyenv/versions/neovim2/bin/python"
let python3_host_prog = "/Users/nos/.pyenv/versions/neovim3/bin/python"

source $HOME/.vim/plugins.vim

set hidden
set autoread
set background=dark
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
"set termguicolors
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
set wildmode=list:longest,full
set wrap

set colorcolumn=+3
set synmaxcol=512
set notimeout
set ttimeout
if !has('nvim')
  set ttimeoutlen=10
endif

set browsedir=buffer
set isfname-==
set complete-=i
set complete-=t
set completeopt-=preview
set completeopt+=menu,menuone

set autoindent
set nocopyindent
set nopreserveindent
set nosmartindent
set nocindent
set noshiftround
set smarttab
set backspace=indent,eol,start

let g:netrw_liststyle = 3
let g:netrw_browsex_viewer = has('mac') ? 'open' : 'xdg-open'

nnoremap gb :ls<CR>:b
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd FileType javascript setlocal suffixesadd+=.js path+=$PWD/node_modules
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.vue setlocal sw=4 filetype=html "poorman's vue setup

syntax on

colorscheme mango

source $HOME/.vim/custom.vim

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let &path.="src/include,/usr/include/AL,dep/,"
let includeexpr=substitute(v:fname,'\\.','/','g')

" for below, via http://superuser.com/a/632661/102651
"
" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

autocmd FileType mail set formatoptions+=t textwidth=72 " enable wrapping in mail
autocmd FileType human set formatoptions-=t textwidth=0 " disable wrapping in txt

" for C-like  programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c,cpp,java set formatoptions+=ro
autocmd FileType c set omnifunc=ccomplete#Complete

" Helpers for command mode
" %% for current buffer file name
" :: for current buffer file path
cnoremap %% <C-R>=fnameescape(expand('%'))<CR>
cnoremap :: <C-R>=fnameescape(expand('%:p:h'))<CR>/

nnoremap <C-l> :nohlsearch<cr>


" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
