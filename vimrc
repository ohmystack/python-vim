" URL: https://github.com/ohmystack/python-vim
" Authors: ohmystack (jiangjun1990@gmail.com)
" Description: A beautiful and efficient vim config.
"              Support for these languages very well: Python, Golang.
"              Besides this vimrc file, some other settings are placed at:
"              plugin/settings/Settings.vim

" Pathogen load
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['YouCompleteMe']

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

runtime bundle/vim-pathogen/autoload/pathogen.vim

" special for different OS
if has('win32')
  " settings for win32
elseif has('unix')
  let shell='/bin/bash'
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " settings for MacOSX
  else
    " settings for linux
  endif
endif

" hit enter to cancel searched highlight
nnoremap <CR> :nohlsearch<CR>
" If there is a new window opened by QuickFix, 
" restore the original <CR> behavior in that buffer.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" select ALL
map <C-A> ggVG

nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>

" Add external paths into ctags
" set tags+=/usr/local/lib/python2.7/dist-packages/tags

set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set synmaxcol=2500                    " give up syntax highlighting after that col
set t_Co=256
set encoding=utf-8
set lazyredraw
set maxmempattern=2000
set guicursor=                        " disable guicursor for neovim

" Airline & Powerline settings
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = "fancy"
let g:airline_theme="ohmystack"

" Colorscheme settings
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"set background=light
colorscheme zenburn-colorful

" Terminal settings
if has('nvim')
  tnoremap <Esc> <Esc>
  " Terminal mode:
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <c-h> <Esc><c-w>h
  inoremap <c-j> <Esc><c-w>j
  inoremap <c-k> <Esc><c-w>k
  inoremap <c-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <c-h> <Esc><c-w>h
  vnoremap <c-j> <Esc><c-w>j
  vnoremap <c-k> <Esc><c-w>k
  vnoremap <c-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <c-h> <c-w>h
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-l> <c-w>l
endif

" ====================
" Python settings
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python setlocal textwidth=80

" ====================
" Python-mode settings

" Load show documentation plugin, 0=off 1=on
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

" Turn off pymode-pylint
let g:pymode_lint = 0
" disable pep8 from checker
let g:pymode_lint_checker = "pylint"
" disable 80 char column
let g:pymode_options_colorcolumn = 0
" use folding function from py-mode
let g:pymode_folding = 1
" Enable automatic virtualenv detection
let g:pymode_virtualenv = 1

" Disable auto-remove unused whitespaces.
let g:pymode_utils_whitespaces = 0

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
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" ====================
" Syntastic
" When set to 1 the cursor will always jump to the first issue detected.
let g:syntastic_auto_loc_list = 0
" Select my syntastic checker
let g:syntastic_python_checkers = ['pylint', 'python']
" pylint disable warnings
let g:syntastic_python_pylint_args = '--disable=C,W,R,missing-docstring --enable=line-too-long'
" Warning / Error codes: https://pypi.python.org/pypi/flake8/1.2
" NOTE: Ignore E111 & E114 is for TensorFlow, who uses only 2 spaces for indentation.
"       Remove these later.
let g:syntastic_python_flake8_args = '--ignore="E111,E114,W503" --max-line-length=80'

" Better :sign interface symbols
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" Syntastic for Go
let g:syntastic_go_checkers = ['govet', 'errcheck', 'golangci-lint']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

" let syntastic_debug=33

" ====================
" ConqueTerm
" Change some key bindings
let g:ConqueTerm_SendFileKey = '<c-F10>'
let g:ConqueTerm_SendVisKey = '<c-F9>'
let g:ConqueTerm_ExecFileKey = '<c-F11>'
let g:ConqueTerm_ToggleKey = '<c-F8>'

" ====================
" Markdown-vim
" disable its auto folding
let g:vim_markdown_folding_disabled=1

" ====================
" BufExplore
map <F3> :BufExplorer<CR>

" Disable beep and flash
set noeb vb t_vb=

" ====================
" Toggle the :Errors (quickfix) window
" Map to <leader>e
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
        " No location/quickfix list shown, open syntastic error location panel
        Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> <leader>e :<C-u>call ToggleErrors()<CR>

" ====================
" Tagbar
nmap <F4> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" ====================
" vim-gitgutter
" Turn off vim-gitgutter by default
let g:gitgutter_enabled = 0
" To disable all key mappings
let g:gitgutter_map_keys = 0
nmap <leader>] :GitGutterToggle<CR>

" ====================
" Folding settings
set foldmethod=syntax
set foldnestmax=1       "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=0

" ====================
" vim-go
" tutorial: https://github.com/fatih/vim-go-tutorial
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 0
let g:godef_split = 2
let g:go_echo_command_info = 0

let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"  "auto import when saving
let g:go_fmt_fail_silently = 1

" vim-go debug
" let g:go_debug = ['lsp', 'shell-commands']

au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>d <Plug>(go-def)

" ====================
" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" ====================
" you-complete-me
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
if has($VIRTUAL_ENV)
  let g:ycm_python_binary_path = system('which python | tr -d "\r\n"')
endif
nnoremap <Leader>d :YcmCompleter GoTo<CR>

" ====================
" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" Fit for python-mode default 'commentstring'
au FileType python let g:NERDSpaceDelims = 0

" ====================
" Bash settings
" use tab for indentation
" http://vim.wikia.com/wiki/Indent_with_tabs,_align_with_spaces
au FileType sh set noexpandtab  

" a Tab2Space and a Space2Tab command that convert leading whitespace
" http://vim.wikia.com/wiki/VimTip1592
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" ====================
" mark (Mark--Karkat)
" Remap to avoid <leader>r conflict with 'align' plugin
nmap <unique> <silent> <Leader>mr <Plug>MarkRegex
vmap <unique> <silent> <Leader>mr <Plug>MarkRegex

" ====================
" Damian-Conway-s-Vim-Setup plugins
" vmath.vim
vmap <silent><expr>  ++  VMATH_YankAndAnalyse()
" dragvisuals.vim
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')

" ====================
" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
    " Disable linting, use Syntastic instead
    let g:LanguageClient_diagnosticsEnable = 0
  endif
endfunction

autocmd FileType * call LC_maps()
