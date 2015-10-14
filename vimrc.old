" Reload .vimrc when saving
autocmd! bufwritepost .vimrc source %

call plug#begin()

" General
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'bling/vim-airline'


" Color Scheme
Plug 'sickill/vim-monokai'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'croaky/vim-colors-github'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

""" Programming Language support

" Python
Plug 'klen/python-mode'
" Plug 'chase/Vim-Jinja2-Syntax'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'phildawes/racer'

" Go
Plug 'fatih/vim-go'

" Scala
Plug 'derekwyatt/vim-scala'

" Docker
Plug 'ekalinin/Dockerfile.vim'

call plug#end()


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
set number
set showmatch
set smartindent
set ts=4 sts=4 sw=4 expandtab
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84
set wildmenu

" No annoying errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remove backups
set noswapfile
set nobackup
set nowb

" Need for old version of vim
if version >= 703
  set colorcolumn=120
endif

" Copy and paste
set pastetoggle=<F3>
set clipboard=unnamedplus


" No annoying sound errors
set noerrorbells
set novisualbell
set t_vd=
set tm=500

" Automatically read the file if edited somewhere
set autoread
" }}}


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>"

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Map sort function to a key
vnoremap <Leader>s :sort<CR>"


" Easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Auto delete whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" Ctrl+Space for code completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>


" Beautify my editor
syntax enable
set background=dark
colorscheme hybrid_material

if has("gui_running")
  " set transparency=5
  " set guifont=Consolas:h14
  set guioptions-=Be
  set guioptions=aAc
  set lines=50 columns=120

  highlight ColorColumn ctermbg=235 guibg=#EBF1F9
endif

""" This unsets the 'last search pattern' register by hitting return
nnoremap <silent> <CR> :noh<CR>

set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,target
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" Disable netrw entirely
let loadednetrw = 1
let loaded_netrwPlug = 1


" NerdTree Settings
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
map <F2> :NERDTreeToggle<CR>

" Session settings
let g:session_autosave = 'no'


let custom = $HOME."/.vimrcustom"
if filereadable(custom)
    execute "source" . custom
endif
