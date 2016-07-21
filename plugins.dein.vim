set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')

call dein#add('tpope/vim-sensible')

call dein#add('CodeFalling/fcitx-vim-osx')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')

call dein#add('Shougo/neossh.vim')

call dein#add('vim-scripts/po.vim--gray')

call dein#add('Shougo/deoplete.nvim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('Shougo/neopairs.vim')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

call dein#add('nicklasos/vim-jsx-riot')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('mhinz/vim-startify')
call dein#add('airblade/vim-gitgutter')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('ntpeters/vim-better-whitespace')

call dein#add('rakr/vim-one')
call dein#add('junegunn/vim-peekaboo')
call dein#add('alvan/vim-closetag')
call dein#add('sickill/vim-pasta')
call dein#add('tpope/vim-surround')

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

  let g:tern_request_timeout = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

""" ultisnips
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'

""" unite.vim
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

""" vimfiler
  let g:vimfiler_as_default_explorer = 1

""" one theme
  let g:one_allow_italics = 1
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  colorscheme one

""" airline
  let g:airline_theme = 'one'
