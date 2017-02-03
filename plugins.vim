call plug#begin('~/.vim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ayu-theme/ayu-vim'
Plug 'brooth/far.vim'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'csscomb/vim-csscomb'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'gavocanov/vim-js-indent'
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'moskytw/nginx-contrib-vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'othree/jspc.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'sickill/vim-pasta'
Plug 'stephpy/vim-yaml'
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': ['javascript', 'javascript.jsx']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wellle/targets.vim'
Plug 'zanglg/nova.vim'
Plug 'zhuangya/vim-auto-plug'

call plug#end()

""""

" plugin configs
"
""""

""" editorconfig
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

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

""" css3 syntax
  autocmd FileType css setlocal iskeyword+=-

""" tagbar
  inoremap <F2> :TagbarToggle<CR>
  nnoremap <F2> :TagbarToggle<CR>

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
   let g:ctrlp_user_command = ['rg --files']
   " let g:ctrlp_user_command = [
   "       \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
   "       \ 'find %s -type f'
   "       \ ]
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

  let g:startify_skiplist = [
              \ 'COMMIT_EDITMSG',
              \ 'bundle/.*/doc',
              \ '/data/repo/neovim/runtime/doc',
              \ ]

  let g:startify_custom_footer =
        \ ['', " There is no spoon.", '']

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

""" IndentLine
  let g:indentLine_char = '┊'
  let g:indentLine_showFirstIndentLevel = 1
  let g:indentLine_setColors = 0

""" vim-grepper

" for browsing the input history
cnoremap <c-n> <down>
cnoremap <c-p> <up>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool rg<cr>

let g:grepper = {
    \ 'tools':     ['rg', 'git'],
    \ 'rg': {
    \   'grepprg': 'rg --vimgrep'
    \ },
    \ 'open':      1,
    \ 'jump':      1,
    \ 'next_tool': '<leader>g',
    \ }

""" pandoc
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"""
" Denite
"""

" Q: What is the correct way to say \"if I'm in a git directory, git ls-files for file_rec\" ?

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <C-t> :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>

