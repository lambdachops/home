set nocompatible
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
map <S-CR>    <CR><CR>end<Esc>-cc
set autoindent
set nu

syntax on
filetype plugin indent on
execute pathogen#infect()
call pathogen#helptags()

if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
let g:solarized_termcolors=256
