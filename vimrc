" Reload .vimrc when saving
autocmd! bufwritepost .vimrc source %

" set nocompatible              " be iMproved, required
filetype off                  " required

" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
call plug#begin()
" Plug 'gmarik/Vundle.vim'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'sickill/vim-monokai'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'croaky/vim-colors-github'
Plug 'scrooloose/syntastic'
Plug 'chriskempson/base16-vim'
""" Programming Language support

" Python
" Plug 'klen/python-mode'
" Plug 'derekwyatt/vim-scala'
" Plug 'chase/Vim-Jinja2-Syntax'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Rust
Plug 'rust-lang/rust.vim'
" Plug 'phildawes/racer'

" Go
Plug 'fatih/vim-go'

" Docker
Plug 'ekalinin/Dockerfile.vim'

call plug#end()


" All of your Plugs must be added before the following line
" call vundle#end()            " required

filetype plugin indent on    " required

"Leader is set to ,
let mapleader = ","

" General settings {{{
set autoindent
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set hlsearch
set ignorecase
set incsearch
" set list
" set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
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
set wildmenu

" Need for old version of vim
if version >= 703
  set colorcolumn=120
endif

" Copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" }}}

set autoread

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
syntax on

if has("gui_running")
  " set transparency=5
  set guifont=Consolas:h14
  set guioptions-=Be
  set guioptions=aAc
  set lines=999 columns=999

set background=light
" colorscheme solarized
" colorscheme github
colorscheme base16-default
" let g:molokai_original = 1

" let &colorcolumn="80,".join(range(120,500),",")
highlight ColorColumn ctermbg=235 guibg=#EBF1F9
endif

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,target
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" Disable netrw entirely
" let g:loadednetrw = 1
" let g:loadednetrwPlug = 1

let loadednetrw = 1
let loaded_netrwPlug = 1


" NerdTree Settings
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

map <F2> :NERDTreeToggle<CR>
