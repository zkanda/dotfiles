" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on


" Reload .vimrc when saving
autocmd! bufwritepost init.vim nested source %

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin()

Plug 'plan9-for-vimspace/acme-colors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-peekaboo'
Plug '/home/linuxbrew/.linuxbrew/opt/fzf/'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

" Python
Plug 'zchee/deoplete-jedi'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Rust
Plug 'sebastianmarkow/deoplete-rust'

" THEMES
" Plug 'lifepillar/vim-solarized8'
" Plug 'rakr/vim-one'
" Plug 'tlhr/anderson.vim'
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'

call plug#end()


set noswapfile
set number
set relativenumber
set showcmd
set ts=4 sts=4 sw=4 expandtab

" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber 

let mapleader=","


" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" SPLIT
" When opening new split, make the default behavior like a modern text edit
set splitbelow
set splitright

" TRUE COLORS
set termguicolors

" COLORSCHEME
" colorscheme solarized8_dark_flat
" colorscheme one
" colorscheme anderson
" colorscheme gruvbox
colorscheme acme
" set background=dark
" let g:gruvbox_contrast_dark="medium"
" let g:gruvbox_contrast_light="medium"

" When calling make, autosave my file
set autowrite

" Shortcut for navigating quickfix
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

" Disable preview
set completeopt-=preview

" Markdown
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4 sts=4

" Golang
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt+=noselect

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" incsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Nerdtree
map <C-k><C-b> :NERDTreeToggle<CR>


" Ctrl-p: Find all git files in directory using FZF
nmap <c-p> :Files<CR>
" FZF
" Ctrl-p: Find all git files in directory
nmap <c-p> :GitFiles<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

