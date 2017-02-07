set lines=60
set columns=180

if has('gui_macvim')
  let g:macvim_skip_colorscheme = 1
  set antialias
  set guifont=Inziu\ IosevkaCC\ SC:h18

  nnoremap  <special>   <D-a>   ggVG
  nnoremap  <special>   <D-v>   p
  vnoremap  <special>   <D-c>   y
endif

runtime! gvimrc.vim

