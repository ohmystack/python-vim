" My currently working version Vimrc
" I kept all other settings in plugins/settings directory
"

" Pathogen load
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['snipmate']

call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

runtime bundle/vim-pathogen/autoload/pathogen.vim

" special for different OS
if has('win32')
  " settings for win32
elseif has('unix')
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " settings for MacOSX
    python import sys; sys.path.append("/Library/Python/2.7/site-packages")
  else
    " settings for linux
  endif
endif

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

" select ALL
map <C-A> ggVG

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>

" Add external paths into ctags
set tags+=/opt/stack/horizon/.venv/lib/python2.7/site-packages/tags

set t_Co=256
