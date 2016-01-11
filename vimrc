" My currently working version Vimrc
" I kept all other settings in plugins/settings directory
"

" Pathogen load
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['snipmate', 'pyflakes-vim', 'taglist.vim', 'vim-powerline', 'ropevim']

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
    python import sys; sys.path.append("/Library/Python/2.7/site-packages")
  else
    " settings for linux
  endif
endif

" hit enter to cancel searched highlight
nnoremap <CR> :nohlsearch<CR>
" If there is a new window opened by QuickFix, 
" restore the original <CR> behavior in that buffer.
autocmd BufWinEnter \[Location List\] nnoremap <buffer> <CR> <CR>
autocmd BufWinEnter \[Quickfix List\] nnoremap <buffer> <CR> <CR>

" select ALL
map <C-A> ggVG

nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>

" Add external paths into ctags
set tags+=/usr/local/lib/python2.7/dist-packages/tags

set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set synmaxcol=250                     " give up syntax highlighting after that col
set t_Co=256
set encoding=utf-8
set lazyredraw

" Airline & Powerline settings
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = "fancy"

" Colorscheme settings
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"set background=light
colorscheme zenburn-colorful

" ====================
" Python-mode settings

" Load show documentation plugin, 0=off 1=on
let g:pymode_doc = 0

" Turn off pymode-pylint
let g:pymode_lint = 0
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
" Syntastic
" When set to 1 the cursor will always jump to the first issue detected.
let g:syntastic_auto_loc_list = 0
" Select my syntastic checker
let g:syntastic_python_checkers = ['pep8', 'pyflakes']
" let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
"
" Use jshint (uses ~/.jshintrc)
" let g:syntastic_javascript_checkers = ['jshint']

" Better :sign interface symbols
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

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
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1
let g:godef_split = 2

let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"  "auto import when saving

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

" ====================
" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
