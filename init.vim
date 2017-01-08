"let python_host_prog = "python"
let python3_host_prog = "python3"

source $HOME/.vim/plugins.vim

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
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
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

"let ayucolor="light"
colorscheme ayu

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

" fixed indentation should be OK for XML and CSS. People have fast internet
" anyway. Indentation set to 2.
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2

" two space indentation for some files
autocmd FileType vim,lua,nginx set shiftwidth=2 softtabstop=2

" for CSS, also have things in braces indented:
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" add completion for xHTML
autocmd FileType xhtml,html set omnifunc=htmlcomplete#CompleteTags

" add completion for XML
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" ensure normal tabs in assembly files
" and set to NASM syntax highlighting
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" Helpers for command mode
" %% for current buffer file name
" :: for current buffer file path
cnoremap %% <C-R>=fnameescape(expand('%'))<CR>
cnoremap :: <C-R>=fnameescape(expand('%:p:h'))<CR>/
