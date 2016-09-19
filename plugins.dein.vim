set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

call dein#add('tyrannicaltoucan/vim-deep-space')
call dein#add('moskytw/nginx-contrib-vim')

call dein#add('tpope/vim-sensible')

call dein#add('metakirby5/codi.vim')
call dein#add('kabbamine/vcoolor.vim')
call dein#add('scrooloose/nerdtree')

call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('CodeFalling/fcitx-vim-osx')

call dein#add('vim-scripts/po.vim--gray')
call dein#add('wellle/targets.vim')
call dein#add('rakr/vim-two-firewatch')

call dein#add('Shougo/deoplete.nvim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('ervandew/supertab')

call dein#add('chrisbra/NrrwRgn')
call dein#add('nicklasos/vim-jsx-riot')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('mhinz/vim-startify')
call dein#add('airblade/vim-gitgutter')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('ntpeters/vim-better-whitespace')

call dein#add('junegunn/fzf', {'build': './install --all'})

call dein#add('junegunn/vim-peekaboo')
call dein#add('alvan/vim-closetag')
call dein#add('sickill/vim-pasta')
call dein#add('tpope/vim-surround')

call dein#add('editorconfig/editorconfig-vim')
call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
call dein#add('isRuslan/vim-es6', {'on_ft': 'javascript'})
call dein#add('mxw/vim-jsx')
call dein#add('gavocanov/vim-js-indent', {'on_ft': 'javascript'})
call dein#add('mileszs/ack.vim')

call dein#add('othree/html5.vim', {'on_ft': 'html'})
call dein#add('ternjs/tern_for_vim', {'build': 'npm install', 'on_ft': 'javascript'})

call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('hail2u/vim-css3-syntax')

call dein#add('majutsushi/tagbar')

call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

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

""" ultisnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'

""" airline
  let g:airline_theme = 'base16_harmonic16'
  let g:airline_powerline_fonts = 1

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

""" NERDTree

  nnoremap <C-\> :NERDTreeToggle<CR>
  inoremap <C-\> <ESC>:NERDTreeToggle<CR>

""" supertab
  let g:SuperTabDefaultCompletionType = "<c-n>"

""" jsx
  let g:jsx_ext_required = 0

""" fzf
  nnoremap <C-i> :FZF<cr>
  inoremap <C-i> <ESC>:FZF<cr>i
