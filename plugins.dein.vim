set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

call dein#add('tpope/vim-sensible')

call dein#add('CodeFalling/fcitx-vim-osx')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('ujihisa/unite-colorscheme')

call dein#add('Shougo/neossh.vim')

call dein#add('vim-scripts/po.vim--gray')

call dein#add('Shougo/deoplete.nvim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('SirVer/ultisnips')
call dein#add('jiangmiao/auto-pairs')
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
call dein#add('hail2u/vim-css3-syntax')

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

""" unite.vim
  call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'winheight': 20,
  \   'direction': 'botright',
  \ })

  nnoremap <C-p> :<C-u>Unite -start-insert file/async neomru/file tab<cr>
  nnoremap <leader>s :<C-u>Unite -start-insert grep/git:/<cr>
  nnoremap <leader>f :<C-u>Unite -start-insert function<cr>

""" vimfiler
  let g:vimfiler_as_default_explorer = 1

""" one theme
  let g:one_allow_italics = 1
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  colorscheme one

""" airline
  let g:airline_theme = 'one'

""" css3 syntax
  autocmd FileType css setlocal iskeyword+=-
