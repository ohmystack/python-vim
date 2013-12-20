" My currently working version Vimrc
" I kept all other settings in plugins/settings directory
"

" Pathogen load
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['snipmate', 'pyflakes-vim']

call pathogen#infect()
call pathogen#helptags()
syntax enable
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

nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>

" Add external paths into ctags
set tags+=/opt/stack/horizon/.venv/lib/python2.7/site-packages/tags

" Colorscheme settings
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"set background=light
colorscheme FreshCut

" ====================
" Python-mode settings

" Load show documentation plugin, 0=off 1=on
let g:pymode_doc = 0

" disable pep8 from checker
let g:pymode_lint_checker = "pylint"

" Disable Folding function from py-mode, use my own Folding configuration in Settings.vim
"let g:pymode_folding = 0

" Disable auto-remove unused whitespaces.
let g:pymode_utils_whitespaces = 0

" pyflakes
"autocmd FileType python map <buffer> <c-F7> :call Flake8()<CR>

" Unload run code plugin
let g:pymode_run = 0

" Key for run python code
"let g:pymode_run_key = '<leader>r'

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_breakpoint_cmd = "import ipdb;ipdb.set_trace() # Set breakpoint_by_jiang"

" rope
" disable rope in python-mode
let g:pymode_rope = 0
" set up ropevim installed by myself
let g:ropevim_enable_autoimport=1
" add the name of modules you want to autoimport
let g:ropevim_autoimport_modules = ["os", "django"]

" ====================
" Dbg
" fix Dbg's bug, cannot run code
map <leader>r :Dbg run<CR>

" ====================
" Conque
" Change some key bindings
let g:ConqueTerm_SendFileKey = '<c-F10>'
let g:ConqueTerm_SendVisKey = '<c-F9>'
let g:ConqueTerm_ExecFileKey = '<c-F11>'

" ====================
" Markdown-vim
" disable its auto folding
let g:vim_markdown_folding_disabled=1

" ====================
" BufExplore
map <F3> :BufExplorer<CR>

" Disable beep and flash
set noeb vb t_vb=
