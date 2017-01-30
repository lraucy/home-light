set t_Co=16
" -----------------------------------------
" Pathogen init
" -----------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" -----------------------------------------
" General vim configuration
" -----------------------------------------
syntax on
filetype on
filetype plugin on
filetype plugin indent on

let g:solarized_termcolors=16
set background=dark
colorscheme solarized

set number
set wildmenu
set ruler

" Search config
set incsearch
set hlsearch

" 4 spaces for indent and display tabs and trailing spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list lcs=tab:>-,trail:.


" Fold config
" Don't change folds while inserting text, until leaving insert mode
" Protect against this when switching between windows
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set foldlevelstart=99
set foldlevel=99

" -----------------------------------------
" Bindings
" -----------------------------------------
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" Toggle autoindent on paste with F4
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>
map <F6> :set foldlevel=99<CR>
map <F7> :set foldlevel=1<CR>
map <F9> :w \| SyntasticCheck<CR>
map <F11> :cp<CR>
map <F12> :cn<CR>

" Add tmux's higher F-key capabilities... weird to have to remap those keys
" but anyway...
if &term == "screen"  " Only when within tmux
    set t_F3=[1;2P~
    set t_F4=[1;2Q~
    set t_F5=[1;2R~
    set t_F6=[1;2S~
    set t_F7=[15;2~
    set t_F8=[17;2~
    set t_F9=[18;2~
endif

" Test shortcuts
map <t_F6> :TestNearest<CR>
map <t_F7> :TestFile<CR>
map <t_F8> :tp<CR>
map <t_F9> :tn<CR>

map <c-p> :FZF<CR>
" Change window with control + direction
map <c-Down> <c-w>j
map <c-Up> <c-w>k
map <c-Right> <c-w>l
map <c-Left> <c-w>h

" Syntastic stuff
let g:syntastic_aggregate_errors=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_args="-f parseable -r n --rcfile=~/.pylint.rc --load-plugins pylint_django"
let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_python_pylint_post_args = '--msg-template="{path}:{line}:{column}:{C}: [{symbol} {msg_id}] {msg}"'

" -----------------------------------------
" -----------------------------------------
" Language specific stuff
" -----------------------------------------
" -----------------------------------------
"
" Docstrings
" -----------------------------------------
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
"
"
" -----------------------------------------
" PHP
" -----------------------------------------
let php_oldStyle = 1
" check syntax with Ctrl + L
autocmd FileType php noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt;
autocmd FileType phtml noremap &lt;

" -----------------------------------------
" HTML
" -----------------------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

" Plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
call plug#end()


" ----------------------------------------
" Additional commands
" ----------------------------------------
" Nice grep with .git & tags exclusion
"command -nargs=1 Grep grep -RnIo --exclude-dir=.git --exclude-dir=venv --exclude=tags <args> .
" Nice grep with .git & tags exclusion, only for Python files
"command -nargs=1 PyGrep grep -RnIo --include='*.py' --exclude-dir=venv --exclude-dir=.git --exclude=tags <args> .


" Plugins settings
" ----------------------------------------
" ----------------------------------------
"
" Powerline
" ----------------------------------------
set nocompatible "disable vi compatibility
set laststatus=2 " always show statusline
set encoding=utf-8 " show unicode glyphs

" Ignore sublime project files
set wildignore=*.sublime-project,*.pyc

" Use Ack instead of grep
"if executable('ag')
"    " Use ag over grep
"    set grepprg=ag\ -s\ --nogroup\ --nocolor\ --column\ --ignore-dir=.git\ --ignore-dir=venv\ --ignore-dir=envlibs
"    set grepformat=%f:%l:%c:%m,%f:%l:%m
"endif
"

" vim-test config
let test#python#runner = 'djangotest'
let test#filename_modifier = ''  " No modifier so it won't resolve symlinks into full path
let test#python#djangotest#executable = 'DJANGO_LOG_LEVEL=INFO python manage.py jenkins'
let test#python#djangotest#options = '--noinput'
