set nocompatible
set showcmd

filetype on
filetype indent on
filetype plugin on
syntax on
set encoding=utf-8
scriptencoding=utf-8
set autoindent
set backspace=indent,eol,start
set hidden

set clipboard+=unnamedplus

set number
set relativenumber

set cursorline

set laststatus=2 
set ruler

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile
set viminfofile=~/.vim/info

set scrolloff=10

set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

set showcmd

set showmode

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildoptions=pum

" Mappings
let mapleader=","

" Esc map
inoremap <Space><leader> <Esc>
vnoremap <Space><leader> <Esc>

" Disable search highlight
nnoremap <leader>m :nohl<CR><C-l>

" Retain visual selection after indent
vnoremap < <gv
vnoremap > >gv

" Move text up and down
map <Esc>j <A-j>
map <Esc>k <A-k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>=gv
vnoremap <A-k> :m '<-2<CR>=gv
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
