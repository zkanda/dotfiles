" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Reload .vimrc when saving
autocmd! bufwritepost init.vim nested source %

let g:os = substitute(system('uname'), '\n', '', '')

call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'govim/govim'

if g:os == "Darwin"
    Plug '/usr/local/opt/fzf'
elseif g:os == "Linux"
    Plug '/home/linuxbrew/.linuxbrew/opt/fzf'
endif
Plug 'junegunn/fzf.vim'

Plug 'lifepillar/vim-gruvbox8'

call plug#end()


set noswapfile
set number
set relativenumber
set showcmd
set ts=4 sts=4 sw=4 expandtab

let mapleader=","
set backspace=indent,eol,start


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
" set termguicolors

" COLORSCHEME
" set background=dark
set background=light
colorscheme gruvbox8

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

" fzf
" ctrl-p: Find all git files in directory
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


au BufRead,BufNewFile *.md setlocal textwidth=80

