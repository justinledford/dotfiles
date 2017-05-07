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
" Directory listing
Plug 'scrooloose/nerdtree'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Syntax checker
Plug 'vim-syntastic/syntastic'

"" Helpers
" Highlight trailing white space
Plug 'ntpeters/vim-better-whitespace'
" Show indent lines
Plug 'Yggdroot/indentLine'

" Generate doxygen comment snippets
Plug 'vim-scripts/DoxygenToolkit.vim'

" Send code to REPL in a tmux pane
Plug 'jpalardy/vim-slime'

" Latex live preview
Plug 'xuhdev/vim-latex-live-preview'

" Typescript syntax highlighting and indenting
Plug 'leafgarland/typescript-vim'
" Typescript syntax checker and navigation
"Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

"" HTML
" Auto close html tags
Plug 'alvan/vim-closetag'
" Highlight html tags
Plug 'gregsexton/MatchTag'

" Show git diff in gutter
Plug 'airblade/vim-gitgutter'


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

" Set Tab key to insert 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Disable modelines
set nomodeline

" Highlight column 80
set colorcolumn=80

" Set to 16 colors to force terminal colors
set t_Co=16

" Added c here to disable YCM messages
set shortmess=filnxtToOc

" Disable showing mode
set noshowmode

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
hi Search               ctermbg=7   ctermfg=0

hi YcmErrorSection      ctermbg=15  ctermfg=0
hi YcmWarningSection    ctermbg=15  ctermfg=0
hi YcmErrorSign         ctermbg=1   ctermfg=7
hi YcmWarningSign       ctermbg=1   ctermfg=7

hi TagbarHighlight      ctermbg=15  ctermfg=0

"" Statusline
set statusline=%f\ %h%w%m%r%y\ %=%(%l,%c%V\ %=\ %P%)


""""""""""""""""""""
""" Mappings
""""""""""""""""""""

"" Set leader key to space
let mapleader=" "

" Cycle through buffers
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Select splits
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

" Switch splits
map <C-X> <C-W><C-X>

"" Open Netrw listing
"map <Leader>e :Lexplore<cr>
map <Leader>e :NERDTreeToggle<cr>

"" Open tagbar
map <Leader>t :TagbarToggle<cr>

"" Reload all buffers
map <Leader>r :checkt<cr>

"" Strip whitespace
map <Leader>s :StripWhitespace<cr>

""""""""""""""""""""
""" Plugins config
""""""""""""""""""""

"" YCM
" Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_tags_files = 1
" Completion for programming language's keyword
let g:ycm_seed_identifiers_with_syntax = 1
" Completion in comments
let g:ycm_complete_in_comments = 1
" Completion in string
let g:ycm_complete_in_strings = 1
let g:ycm_path_to_python_interpreter = "/usr/bin/python"
" Auto load conf file
let g:ycm_confirm_extra_conf = 0
" Disable diagnostics UI for compatibility with Syntastic
let g:ycm_show_diagnostics_ui = 0
" autoclose info split
autocmd CompleteDone * pclose

"" Doxygen
" use // comments instead of /* */
let g:DoxygenToolkit_commentType = "C++"

"" Latex Live Preview
let g:livepreview_previewer = 'zathura'

"" vim-slime
let g:slime_target = "tmux"

"" Gutentags
" Cache all tags in dir
let g:gutentags_cache_dir = "~/.tags"

"" Syntastic
" Auto close when no errors, auto open when errors
let g:syntastic_auto_loc_list = 1

" Check everything except html
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
