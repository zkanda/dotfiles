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
Plug 'mhinz/vim-startify'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'


Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto switch paste mode
Plug 'ConradIrwin/vim-bracketed-paste'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tomasr/molokai'

Plug 'sheerun/vim-polyglot'

" Golang
Plug 'fatih/vim-go'

" Python
Plug 'fisadev/vim-isort'
Plug 'tmhedberg/SimpylFold'

" Javascript
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'plasticboy/vim-markdown'

" CSS
" Plug 'hail2u/vim-css3-syntax'

call plug#end()

" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %

"Leader is set to ,
let mapleader = ","

set number
set nobackup
set nowritebackup
set noswapfile
set ts=2 sts=2 sw=2 expandtab
set colorcolumn=120

" When opening new split, make the default behavior like a modern text editor
set splitbelow
set splitright


" Ctrl-p: Find all git files in directory using FZF
nmap <c-p> :GitFiles<CR>

" syntax enable
set background=light
" colorscheme Tomorrow-Night-Eighties
colorscheme solarized

" Golang
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Python
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4 sts=4
" ab ip import ipdb; ipdb.set_trace()
let g:PyFlakeOnWrite = 1

" Javascript
let g:javascript_enable_domhtmlcss = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_width = '80%'

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Set GUI Options
if has("gui_running")
  if has("gui_gtk2")

    set guifont=Consolas\ Regular\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  endif
  set guioptions-=Be
  set guioptions=aAc
  set lines=50 columns=120

  highlight ColorColumn ctermbg=235 guibg=#EBF1F9
endif

" YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'distinguished'
let g:airline_theme = 'solarized'

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
