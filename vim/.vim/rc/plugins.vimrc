" Specify directory for plugins
call plug#begin('~/.vim/plugged')

"" General

" Autocomplete engine
Plug 'Valloric/YouCompleteMe'

" Move between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Show buffers in tabline
Plug 'ap/vim-buftabline'

" Edit 'surroundings'
Plug 'tpope/vim-surround'

call plug#end()
