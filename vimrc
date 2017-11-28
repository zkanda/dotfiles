" Reload .vimrc when saving
autocmd! bufwritepost .vimrc nested source %
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let remote=$REMOTE

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug '/home/linuxbrew/.linuxbrew/opt/fzf/'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neocomplete.vim'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'

Plug 'haya14busa/incsearch.vim'

Plug 'Chiel92/vim-autoformat'

Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" Auto switch paste mode
Plug 'ConradIrwin/vim-bracketed-paste'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'

" Golang
Plug 'fatih/vim-go'

" Python
Plug 'fisadev/vim-isort'
Plug 'tmhedberg/SimpylFold'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'


call plug#end()

" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %

"Leader is set to ,
let mapleader = ","

set number
set relativenumber
set nobackup
set nowritebackup
set noswapfile
set ts=2 sts=2 sw=2 expandtab
set colorcolumn=120
set fileencoding=utf-8

" When opening new split, make the default behavior like a modern text editor
set splitbelow
set splitright

set termguicolors

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

" Move between open buffers.
" nmap <C-n> :bnext<CR>
" nmap <C-p> :bprev<CR>


let g:nord_comment_brightness = 20
" syntax enable
set background=light
" colorscheme nord
colorscheme solarized
" colorscheme anderson
" colorscheme gruvbox
" let g:gruvbox_contrast_light="medium"


" Autoformat
fun! AutoformatExcept()
  " Don't strip on these filetypes
  " if &ft =~ 'markdown\|ansible\|ruby\|javascript\|perl'
  if &ft =~ 'python'
    :Autoformat
  endif
  return
endfun

au BufWrite * call AutoformatExcept()


" Golang
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
let g:go_fmt_command = "goimports"

" Python
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4 sts=4 " ab ip import ipdb; ipdb.set_trace()
let g:PyFlakeOnWrite = 1
let g:formatter_yapf_style = 'pep8'

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_width = '80%'

" Limelight
" let g:limelight_conceal_ctermfg = 'gray'
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_us


" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" neocomplete
let g:neocomplete#enable_at_startup = 1


autocmd CompleteDone * pclose

" Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
