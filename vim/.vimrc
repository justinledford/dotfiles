""""""""""""""""""""
""" Plugins
""""""""""""""""""""

" Specify directory for plugins
call plug#begin('~/.vim/plugged')

"" General

" Autocomplete engine
Plug 'Valloric/YouCompleteMe'

" Auto generate tags
Plug 'ludovicchabant/vim-gutentags'

" Display tags in a window
Plug 'majutsushi/tagbar'

" Syntax checker
Plug 'vim-syntastic/syntastic'

" Highlight trailing white space
Plug 'ntpeters/vim-better-whitespace'

" Show indent lines
Plug 'Yggdroot/indentLine'

" Show git diff in gutter
Plug 'airblade/vim-gitgutter'

" Move between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Show buffers in tabline
Plug 'ap/vim-buftabline'

" git wrapper
Plug 'tpope/vim-fugitive'

" Edit 'surroundings'
Plug 'tpope/vim-surround'

call plug#end()

""""""""""""""""""""
""" vim config
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

" Set to 16 colors to force terminal colors
set t_Co=16

" Added c here to disable YCM messages
set shortmess=filnxtToOc

" Disable showing mode
" set noshowmode

" Fix syntax highlighting
autocmd BufEnter * :syntax sync fromstart

" Keep undo history
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Change directory to the current buffer when opening files
set autochdir

" Remove ruler
set noruler

" Always show status line
set laststatus=2

" Show quotes in JSON
set conceallevel=0

" Skip prompt on reload buffers
set autoread

" Set a faster update time
set updatetime=250

" Fix backspace
set backspace=2

" Highlight search term
set hlsearch

" Set signcolumn always on
set signcolumn=yes

" Set netrw to list style to tree style
let g:netrw_liststyle=3

" Hide netrw banner
let g:netrw_banner=0

" Show relative line numbers
set relativenumber

" Don't add newline at end of file
set nofixeol

" Don't prompt to save buffer if switching
set hidden

""""""""""""""""""""
""" Theme
""""""""""""""""""""

"" Colors
hi Pmenu                ctermbg=15  ctermfg=0
hi PmenuSel             ctermbg=4   ctermfg=15
hi Visual               ctermbg=12  ctermfg=15
hi StatusLine           ctermbg=4   ctermfg=7   cterm=NONE
hi StatusLineNC         ctermbg=15  ctermfg=0   cterm=NONE
hi MatchParen           ctermbg=15  ctermfg=0
hi ColorColumn          ctermbg=15
hi Folded               ctermbg=15  ctermfg=0
hi LineNr               ctermbg=15  ctermfg=0
hi Todo                 ctermbg=15  ctermfg=0
hi Search               ctermbg=15  ctermfg=0

hi YcmErrorSection      ctermbg=15  ctermfg=0
hi YcmWarningSection    ctermbg=15  ctermfg=0
hi YcmErrorSign         ctermbg=1   ctermfg=7
hi YcmWarningSign       ctermbg=1   ctermfg=7

hi TagbarHighlight      ctermbg=15  ctermfg=0

hi TabLineSel           ctermbg=4   ctermfg=15  cterm=NONE
hi BufTabLineActive     ctermbg=15  ctermfg=0
hi TabLine              ctermbg=15  ctermfg=0   cterm=NONE
hi TabLineFill                      ctermfg=15

"" Statusline

set statusline=%f                                 " filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}]                           " file format
set statusline+=\ %h                              " help file flag
set statusline+=%m                                " modified flag
set statusline+=%r                                " read only flag
set statusline+=%y                                " filetype

set statusline+=%#error#                          " show error if file has
set statusline+=%{MixedIndentingWarning()}        " mix of tabs and spaces
set statusline+=%*

set statusline+=%=                                " left/right separator
set statusline+=%l,%c                             " line number, column number
set statusline+=\ %P                              " percent through file


""""""""""""""""""""
""" Mappings
""""""""""""""""""""

"" Set leader key to space
let mapleader=" "

" Switch splits
map <C-X> <C-W><C-X>

"" Open Netrw listing
map <Leader>e :Explore<cr>

"" Open tagbar
map <Leader>t :TagbarToggle<cr>

"" Reload all buffers
map <Leader>r :checkt<cr>

"" Strip whitespace
map <Leader>s :StripWhitespace<cr>

"" Delete current buffer
map <Leader>bd :bp\|bd<Space>#<cr>

"" Change all tabs to spaces
map <Leader>rt :retab<cr>

"" Hit enter to clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Switch to open buffers
map K :bnext<CR>
map J :bprevious<CR>

""""""""""""""""""""
""" Plugins config
""""""""""""""""""""

"" YCM
" Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_tags_files = 0
" Completion for programming language's keyword
let g:ycm_seed_identifiers_with_syntax = 1
" Completion in comments
let g:ycm_complete_in_comments = 1
" Completion in string
let g:ycm_complete_in_strings = 1
let g:ycm_path_to_python_interpreter = "/usr/bin/python3"
" Auto load conf file
let g:ycm_confirm_extra_conf = 0
" Disable diagnostics UI for compatibility with Syntastic
let g:ycm_show_diagnostics_ui = 0
" autoclose info split
autocmd CompleteDone * pclose

"" Gutentags
" Cache all tags in dir
let g:gutentags_cache_dir = "~/.tags"

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Check everything except html
let g:syntastic_mode_map={ 'mode': 'passive',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }
