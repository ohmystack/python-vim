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

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

" select ALL
map <C-A> ggVG

set background=dark
colorscheme Tomorrow

nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>

" Add external paths into ctags
set tags+=/opt/stack/horizon/.venv/lib/python2.7/site-packages/tags
