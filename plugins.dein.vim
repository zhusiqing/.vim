set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')

call dein#add('tpope/vim-sensible')

call dein#add('CodeFalling/fcitx-vim-osx')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neopairs.vim')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('mhinz/vim-startify')
call dein#add('airblade/vim-gitgutter')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('ntpeters/vim-better-whitespace')

call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('editorconfig/editorconfig-vim')
call dein#add('isRuslan/vim-es6', {'on_ft': 'javascript'})
call dein#add('mileszs/ack.vim')

call dein#add('othree/html5.vim', {'on_ft': 'html'})
call dein#add('posva/vim-vue', {'on_ft': 'vue'})
call dein#add('ternjs/tern_for_vim', {'build': 'npm install', 'on_ft': 'javascript'})

call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

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


""" editorconfig
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" deoplete
  let g:deoplete#enable_at_startup = 1

""" ultisnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'


""" vimfiler
  let g:vimfiler_as_default_explorer = 1
