call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mhartington/nvim-typescript', { 'for': ['typescript'] }
  """ deoplete
  let g:deoplete#enable_at_startup = 1

  let g:tern_request_timeout = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
        \ 'tern#Complete',
        \ 'jspc#omni'
        \]
endif

Plug 'Shougo/echodoc.vim'

Plug 'mileszs/ack.vim'
  let g:ackprg = 'rg --vimgrep --no-heading'
  nmap <leader>a :Ack<space>
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
  let g:ale_enabled = 0
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1
  let g:ale_keep_list_window_open = 1
  let g:airline#extensions#ale#enabled = 1
  let g:ale_change_sign_column_color = 1
  let g:ale_css_stylelint_use_global = 1
  let g:ale_css_stylelint_executable='stylelint'
  let g:ale_sass_stylelint_executable='sasslint'
  let g:ale_sass_styelint_use_global=1
Plug 'tweekmonster/startuptime.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'csscomb/vim-csscomb'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'hail2u/vim-css3-syntax'
Plug 'junegunn/vim-peekaboo'
Plug 'mhinz/vim-startify'
Plug 'moskytw/nginx-contrib-vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'

autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
let g:neoformat_try_formatprg = 1
"autocmd BufWritePre *.js Neoformat
Plug 'stephpy/vim-yaml'
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': ['javascript', 'javascript.jsx']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/gina.vim'
Plug 'kassio/neoterm'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'zanglg/nova.vim'
Plug 'zhuangya/vim-auto-plug'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

call plug#end()

""""

" plugin configs
"
""""


""" css3 syntax
  autocmd FileType css setlocal iskeyword+=-

""" ctrlp
   let g:ctrlp_use_caching = 1
   let g:ctrlp_clear_cache_on_exit = 0
   let g:ctrlp_cache_dir = '$HOME/.vim/cache/ctrlp'
   let g:ctrlp_max_files = 1000
   let g:ctrlp_max_history = &history
   let g:ctrlp_max_depth = 10
   let g:ctrlp_custom_ignore = {
     \ 'dir': '\v[\/]\.(git|hg|svn)$',
     \ 'fire': '\v\.(exe|so|dll)$',
   \ }
   " let g:ctrlp_user_command = ['rg --files']
   let g:ctrlp_user_command = [
         \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
         \ 'rg %s --files --color=never --glob ""',
         \ 'find %s -type f'
         \ ]
   let g:ctrlp_working_path_mode = 'ra'
   let g:ctrlp_reuse_window = 'startify'

""" startify
  autocmd User Startified setlocal cursorline

  let g:startify_enable_special         = 0
  let g:startify_files_number           = 8
  let g:startify_relative_path          = 1
  let g:startify_change_to_dir          = 1
  let g:startify_update_oldfiles        = 1
  let g:startify_session_autoload       = 1
  let g:startify_session_persistence    = 1
  let g:startify_session_delete_buffers = 1

  let g:startify_session_dir = '$HOME/.vim/startify-sessions'

  let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

  " let g:startify_custom_footer =
  "       \ ['There is no spoon']

  let g:startify_custom_header =
        \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')

  hi StartifyBracket ctermfg=240
  hi StartifyFile    ctermfg=147
  hi StartifyFooter  ctermfg=240
  hi StartifyHeader  ctermfg=114
  hi StartifyNumber  ctermfg=215
  hi StartifyPath    ctermfg=245
  hi StartifySlash   ctermfg=240
  hi StartifySpecial ctermfg=240

""" supertab
  let g:SuperTabDefaultCompletionType = "<c-n>"

""" jsx
  let g:jsx_ext_required = 0

""" csscomb
  autocmd FileType css nnoremap <buffer> <leader>bc :CSScomb<CR>
  autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

""" pandoc
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
