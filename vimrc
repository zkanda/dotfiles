" Reload .vimrc when saving
autocmd! bufwritepost .vimrc nested source %

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'altercation/vim-colors-solarized'

" Golang
Plug 'fatih/vim-go'

call plug#end()

" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %

set number
set nobackup
set nowritebackup
set noswapfile
set ts=2 sts=2 sw=2 expandtab


" Ctrl-p: Find all git files in directory using FZF
nmap <c-p> :GitFiles<CR>

if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" syntax enable
set background=light
colorscheme solarized


" Golang
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4


" Goyo
nnoremap <silent> <leader>z :Goyo<cr>
