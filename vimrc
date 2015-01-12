" Reload .vimrc when saving
autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'

""" Programming Language support

" Python
Plugin 'klen/python-mode'

" Rust
Plugin 'wting/rust.vim'

""" Application specific

" Docker
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" Nginx
Plugin 'nginx/nginx' , {'rtp': '/contrib/vim/'}



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Leader is set to ,
let mapleader = ","

" General settings {{{
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Monaco:h11
set guioptions-=Be
set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set number
set showmatch
set smartcase
set smartindent
set ts=2 sts=2 sw=2 expandtab
set visualbell
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84

" Copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" }}}


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>"


" Map sort function to a key
vnoremap <Leader>s :sort<CR>"


" Easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Auto delete whitespace on write
autocmd BufWritePre * :%s/\s\+$//e


" Beautify my editor
syntax enable
set background=dark
colorscheme solarized
if has("gui_running")
  set transparency=5
endif

