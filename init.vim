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

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jlanzarotta/bufexplorer'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}


Plug 'hashivim/vim-hashicorp-tools'


" THEMES
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'tlhr/anderson.vim'

call plug#end()


set noswapfile
set number
set showcmd

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
if (has("termguicolors"))
  set termguicolors
endif

" COLORSCHEME
" colorscheme solarized8_dark_flat
" colorscheme one
colorscheme anderson
set background=dark

" When calling make, autosave my file
set autowrite

" Shortcut for navigating quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Disable preview
set completeopt-=preview

" Golang
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

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

" hashivim
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s

