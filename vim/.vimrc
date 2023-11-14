""""""""""""""""""""
""" config
""""""""""""""""""""

" Turn syntax highlighting on
syntax on

" Show line numbers
set number

" Enable auto indent by filetype
filetype plugin indent on

" Set Tab key to insert 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Disable modelines
set nomodeline

" Highlight column 80
set colorcolumn=80

" Keep undo history
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Change directory to the current buffer when opening files
set autochdir

" Always show status line
set laststatus=2

" Disable text concealing (e.g. show quotes in JSON)
set conceallevel=0

" Set a faster update time
set updatetime=250

" Highlight search term
set hlsearch

" Set signcolumn always on
set signcolumn=yes

" Show relative line numbers
set relativenumber

" Don't add newline at end of file
set nofixeol

" Don't prompt to save buffer if switching
set hidden

" Set netrw to list style to tree style
let g:netrw_liststyle=3

" Hide netrw banner
let g:netrw_banner=0

" Set leader key to space
let mapleader=" "

" Switch splits
map <C-X> <C-W><C-X>

" Open Netrw listing
map <Leader>e :Explore<cr>

" Delete current buffer
map <Leader>bd :bp\|bd<Space>#<cr>

" Change all tabs to spaces
map <Leader>rt :retab<cr>

" Hit enter to clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Switch to open buffers
map K :bnext<CR>
map J :bprevious<CR>

""""""""""""""""""""
""" mappings
""""""""""""""""""""

"" Set leader key to space
let mapleader=" "

" Switch splits
map <C-X> <C-W><C-X>

"" Open Netrw listing
map <Leader>e :Explore<cr>

"" Reload all buffers
map <Leader>r :checkt<cr>

"" Delete current buffer
map <Leader>bd :bp\|bd<Space>#<cr>

"" Change all tabs to spaces
map <Leader>rt :retab<cr>

"" Hit enter to clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Switch to open buffers
map K :bnext<CR>
map J :bprevious<CR>

map <Leader>gt :YcmCompleter GoTo<CR>
map <Leader>f :YcmCompleter FixIt<CR>

map <Leader>jf :%!jq --indent 4 .<CR>

map <Leader>t :TagbarToggle<CR>
map <Leader>tj :TagbarOpen j<CR>

" fzf
map <Leader>o :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>a :Ag<CR>

map <Leader>s :%Subvert/

""""""""""""""""""""
""" plugins
""""""""""""""""""""

" Specify directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'ap/vim-buftabline'

Plug 'vim-syntastic/syntastic'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'

Plug 'ludovicchabant/vim-gutentags'

Plug 'preservim/tagbar'

Plug 'dense-analysis/ale'

call plug#end()

""""""""""""""""""""
""" plugin settings
""""""""""""""""""""

" Auto close autocomplete window
autocmd CompleteDone * pclose
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_global_ycm_extra_conf = ''

let g:ale_linters = {
\   'cpp': ['clangtidy'],
\}
let g:ale_lint_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 1
