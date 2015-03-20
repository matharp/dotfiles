"----------------
"Pratham's .vimrc
"----------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"List of plugins to be installed by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'snipMate'
Plugin 'CRefVim'
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()
filetype plugin indent on

colorscheme solarized
set background=dark

if has('gui_running')
    set guioptions=-m
    set guioptions=-t
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
    if has('gui_gtk2')
    elseif has('gui_win32')
        set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
        au GUIEnter * simalt ~x
    endif
endif

set number
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
set smartcase
set wildmenu
set title
set history=100
set noshowmode
set spell
set list
set listchars=tab:»·,trail:·,extends:¸
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
let g:airline_theme='powerlineish'
au BufRead,BufNewFile *.md set filetype=markdown
autocmd BufEnter * lcd %:p:h

inoremap jj <ESC>
inoremap ;<cr> <end>;<cr>
nore ; :
nore : ;
let mapleader=','
noremap <leader>rr :edit $HOME/.vimrc<CR>
noremap <leader>ll :source $HOME/.vimrc<CR>
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>q :NERDTreeToggle <CR>
noremap <leader>m :silent make\|redraw!\|cc <CR>
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
nmap <Leader>cref <Plug>CRV_CRefVimInvoke

inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = '24'
let g:NERDTreeQuitOnOpen = 'false'
let g:NERDTreeChDirMode = '1'
let g:NERDTreeShowBookmarks = '1'

let g:table_mode_header_fillchar = '='
let g:table_mode_corner_corner = '+'
