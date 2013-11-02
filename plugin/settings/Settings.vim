set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard+=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=5                       " start scrolling when n lines away from margins
set switchbuf=useopen
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=			                        " disable encryption
set synmaxcol=128
set viminfo=			                    " disable .viminfo file
set ttyfast                           " send more chars while redrawing

filetype on                           " enable filetype detection
filetype indent on                    " enable filetype-specific indenting
filetype plugin on                    " enable filetype-specific plugins

syntax on                             " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set t_Co=256
" try
"  colorscheme railscasts
"catch
"endtry

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shortmess=Ia                      " remove splash wording

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" ======================================
"  custom key and plugin configurations
" ======================================
" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" comment
map <Leader><Leader> <Leader>c<space>

" next and prev tab
noremap <F7> gT
noremap <F8> gt

" identation
nmap <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv
vmap <S-TAB> <gv

" remap VIM 0
map 0 ^

" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>
map <leader>0 :topleft 100 :split README.md<CR>

" switch between splited windows
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-j> <c-w>j
imap <c-l> <ESC><c-w>l
imap <c-h> <ESC><c-w>h
imap <c-k> <ESC><c-w>k
imap <c-j> <ESC><c-w>j

let g:jedi#rename_command = "<leader>rn"


" ====================
" Python-mode settings

" Load show documentation plugin, 0=off 1=on
let g:pymode_doc = 0

" disable pep8 from checker
let g:pymode_lint_checker = "pylint"

" Disable Folding function from py-mode, use my own Folding configuration in Settings.vim
"let g:pymode_folding = 0

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
