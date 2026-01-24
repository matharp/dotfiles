"----------------
"Pratham's .vimrc
"----------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"List of plugins to be installed by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

call vundle#end()
filetype plugin indent on

if has('gui_running')
    autocmd GUIEnter * set vb t_vb=
    set guioptions=-m
    set guioptions=-t
    if has('gui_gtk2')
    elseif has('gui_win32')
        set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI
        au GUIEnter * simalt ~x
    endif
endif

set encoding=utf-8
set hidden
set backspace=indent,eol,start

set wrap
set linebreak
set nolist

set shiftwidth=4
set tabstop=8
set expandtab
set softtabstop=4
"save marks for 100 files and save global marks; f0 for disabling global
set viminfo='100,f1
set t_Co=256
set cursorline
set matchtime=2
set matchpairs+=<:>
set incsearch
set hlsearch
set showmatch
set showcmd
set autoindent
set smartindent
set mouse=a
set ruler
set laststatus=2
set ignorecase
set wildmenu
set title
set history=100
set noshowmode
set nospell
set textwidth=0
set wrapmargin=0

set foldcolumn=0
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=99

set backup
set backupdir=$HOME/.vim/backup
set backupext=~
set confirm
set autochdir
set splitright

set equalalways
set winfixwidth

syntax enable

highlight ShowTrailingWhitespace guibg=SlateBlue
highlight Search guibg='#FF0090'
let g:airline_powerline_fonts=1
au BufRead,BufNewFile *.md set filetype=markdown
autocmd BufEnter * lcd %:p:h

inoremap jj <ESC>
let mapleader=','
noremap <leader>rr :edit $HOME/.vimrc<CR>
noremap <leader>[[ :CSnext <CR>
noremap <leader>ll :source $HOME/.vimrc<CR>
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>q :NERDTreeToggle<CR>
noremap <leader>m :silent make\|redraw!\|cc <CR>
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
nmap <Leader>cref <Plug>CRV_CRefVimInvoke
noremap <leader>d :r !date<CR>
" insert date
"basic date
nmap <F3> i<C-R>=strftime("%Y%m%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y%m%d")<CR>
"date with extra info
nmap <F4> i<C-R>=strftime("%Y%m%d %a %H:%M")<CR><Esc>
imap <F4> <C-R>=strftime("%Y%m%d %a %H:%M")<CR>

inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

" map typo
cmap wq1 wq!

let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = '24'
let g:NERDTreeQuitOnOpen = 'false'
let g:NERDTreeChDirMode = '1'
let g:NERDTreeShowBookmarks = '1'

let g:table_mode_header_fillchar = '='
let g:table_mode_corner_corner = '+'
