set nocompatible
set showcmd

filetype on
filetype indent on
filetype plugin on
syntax on
set encoding=utf-8
scriptencoding=utf-8
set autoindent
set wrap
set linebreak
set nolist 
set backspace=indent,eol,start
set hidden


set path+=**

set clipboard=unnamedplus

set mouse=a

set number
set relativenumber

set shiftwidth=4
set tabstop=4
set expandtab
set foldmethod=marker

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
set shortmess-=S

set showcmd

set showmode

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildoptions=pum

let g:netrw_banner=0

set termguicolors
set t_Co=256

colorscheme slate
set background=dark

" Java syntax highlight 
let java_highlight_functions = 1
let java_highlight_all = 1
let java_highlight_java_util= 1
let g:java_highlight_java_io = 1
let g:java_highlight_functions = "style"
let g:java_highlight_signature = 1
let g:java_highlight_generics = 1
let g:java_highlight_java_lang_ids = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

set cursorline

" STATUSLINE {{{
set ruler
set laststatus=2 

set statusline=
set statusline+=\ 
set statusline+=%t
set statusline+=\ 
set statusline+=%7{b:gitbranch}
set statusline+=\ 
set statusline+=%m
set statusline+=\ 
set statusline+=%h
set statusline+=\ 
set statusline+=%r
set statusline+=%=
set statusline+=%l
set statusline+=,
set statusline+=%-13v
set statusline+=\ 
set statusline+=%P
set statusline+=\ 

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').")"
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

"}}}

" MAPPINGS {{{
let mapleader=","

" Esc map
inoremap <Space><leader> <Esc>
vnoremap <Space><leader> <Esc>

" Disable search highlight
nnoremap <leader>m :nohl<CR><C-l>

" Retain visual selection after indent
vnoremap < <gv
vnoremap > >gv

" Move text 
map <Esc>j <A-j>
map <Esc>k <A-k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>=gv
vnoremap <A-k> :m '<-2<CR>=gv
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Buffers
nnoremap <S-Up> :resize -2<CR> 
nnoremap <S-Down> :resize +2<CR>
nnoremap <S-Left> :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
nnoremap <S-l> :bnext <CR>
nnoremap <S-h> :bprevious <CR>

" File explorers
nnoremap <leader>e :Ex<CR>
nnoremap <leader>l :Lex 20<CR>

"}}}


" Plugins configuration

