" ----------------
" Pratham's .vimrc (trimmed)
" ----------------

" Modern behavior.
set nocompatible

" vim-plug (optional): works if installed, no hard failure on clean systems.
if filereadable(expand('~/.vim/autoload/plug.vim'))
  source ~/.vim/autoload/plug.vim
  call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind']}
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/fzf.vim', {'on': ['Files', 'GFiles', 'Buffers', 'History', 'Helptags', 'Maps', 'Commands', 'Lines', 'BLines', 'Rg', 'Ag']}
  Plug 'junegunn/fzf', {'on': ['Files', 'GFiles', 'Buffers', 'History', 'Helptags', 'Maps', 'Commands', 'Lines', 'BLines', 'Rg', 'Ag']}
  call plug#end()
endif

filetype plugin indent on
syntax enable

" Core editing defaults.
set hidden
set number
set relativenumber
set nowrap
set linebreak
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab
set autoindent
set smartindent
set mouse=a
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set wildmenu
set completeopt=menuone,noselect
set shortmess+=c
set signcolumn=auto
set updatetime=300
set timeoutlen=400
set splitright
set splitbelow
set scrolloff=4
set sidescrolloff=8
set foldmethod=manual
set foldcolumn=0
set confirm
set backup
set backupext=~
set undofile

" Session/history compatibility (Vim/Neovim).
if has('nvim')
  set shada='100,f1
else
  set viminfo='100,f1
endif

" Enable truecolor when available.
if has('termguicolors')
  set termguicolors
endif

" Fresh-install safety: create dirs as needed.
if !isdirectory(expand('~/.vim/backup'))
  call mkdir(expand('~/.vim/backup'), 'p')
endif
set backupdir=$HOME/.vim/backup

if !isdirectory(expand('~/.vim/undo'))
  call mkdir(expand('~/.vim/undo'), 'p')
endif
set undodir=$HOME/.vim/undo

" Clipboard integration when available.
if has('clipboard')
  set clipboard=unnamedplus
endif

" Small helper: run command only when it exists.
function! s:RunIfCommandExists(cmd, missing_msg) abort
  if exists(':' . a:cmd)
    execute a:cmd
  else
    echo a:missing_msg
  endif
endfunction

" Filetype-specific wrapping for prose.
augroup pratham_vimrc_autocmds
  autocmd!
  autocmd FileType markdown,text,gitcommit setlocal wrap linebreak
  autocmd FileType * if index(['markdown','text','gitcommit'], &filetype) < 0 | setlocal nowrap | endif
augroup END

" Keymaps (minimal + high-value).
let mapleader=','
inoremap jj <ESC>
nnoremap <leader>rr :edit $HOME/.vimrc<CR>
nnoremap <leader>ll :source $HOME/.vimrc<CR>

if has('clipboard')
  nnoremap <leader>y "+y
  nnoremap <leader>p "+p
else
  nnoremap <leader>y y
  nnoremap <leader>p p
endif

nnoremap <silent> <leader>q :call <SID>RunIfCommandExists('NERDTreeToggle', 'NERDTree not available')<CR>
nnoremap <leader>m :silent make\|redraw!\|cc <CR>
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
nnoremap <leader>d :r !date<CR>

inoremap <C-w> <C-\\><C-o>dB
inoremap <C-BS> <C-\\><C-o>db
cmap wq1 wq!

" NERDTree behavior.
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 24
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeChDirMode = 1
let g:NERDTreeShowBookmarks = 1
