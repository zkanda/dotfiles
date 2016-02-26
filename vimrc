" Reload .nvimrc when saving
autocmd! bufwritepost .vimrc source %
" Autoinstall vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.vim/plugged')

" Group dependencies, vim-snippets depends on ultisnips
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/syntastic'

" Color Scheme
Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Python Language
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'

call plug#end()

"Leader is set to ,
let mapleader = ","

" General Settings
set nu
set ts=4 sts=4 sw=4 expandtab
set autoread


" Open panes on right and below
set splitright
set splitbelow

" Shorcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Invisibles
set listchars=tab:▸\ ,eol:¬


" Mappings for buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Easier moving between tabs
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>"

" CtrlP Settings
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,target
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" Airline Settings
let g:airline#extensions#tabline#enabled = 1

" Smart way to move between windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Set colorscheme
set background=light
colorscheme anderson

" Remove backups
set noswapfile
set nobackup
set nowb

" let g:jedi#force_py_version = 3

" Clear last search highlighting
nnoremap <silent> <CR> :nohlsearch<CR>

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>
