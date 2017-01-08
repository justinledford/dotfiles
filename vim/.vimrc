"required for vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install plugins
Plugin 'gmarik/Vundle.vim'

" autocompleter
Plugin 'Valloric/YouCompleteMe'

" doxygen
Plugin 'vim-scripts/DoxygenToolkit.vim'

" modeline and colors
"Plugin 'chriskempson/base16-vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'daviesjamie/vim-base16-lightline'


" help
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'

" clojure
"Plugin 'tpope/vim-fireplace'

" common lisp repl, etc
"Plugin 'kovisoft/slimv'

Plugin 'jpalardy/vim-slime'

Plugin 'vim-scripts/SyntaxRange'

" latex
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set nomodeline
"let g:base16_shell_path="/home/justin/.dotfiles/colors/"
"let base16colorspace=256
"colorscheme base16-deafened-mod
set colorcolumn=80
set t_Co=16
"set background=light

" Added c here to disable YCM messages
set shortmess=filnxtToOc

" Show detailed status
set laststatus=2
" Disable default mode status
set noshowmode

"fix syntax highlighting
autocmd BufEnter * :syntax sync fromstart

" easy buffer/split switching
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>
map <C-X> <C-W><C-X>

" keep undo history
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Color edits
hi Pmenu ctermfg=0 ctermbg=15 guifg=#ffffff guibg=#000000
hi PmenuSel ctermfg=15 ctermbg=4 guifg=#ffffff guibg=#000000
hi Visual ctermbg=12 ctermfg=15
hi StatusLine ctermfg=0 ctermbg=15 cterm=NONE
hi StatusLineNC ctermfg=0 ctermbg=7 cterm=NONE

hi YcmErrorSection ctermbg=15 ctermfg=0
hi YcmWarningSection ctermbg=15 ctermfg=0
hi YcmErrorSign ctermbg=1 ctermfg=7
hi YcmWarningSign ctermbg=1 ctermfg=7

hi ColorColumn ctermbg=15

hi Folded ctermbg=15 ctermfg=0
hi LineNr ctermbg=15 ctermfg=0


" Formats the statusline
"set statusline=%f                           " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%y      "filetype
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=\ %=                  " align left
"set statusline+=%p%%    "percent lines of file
"set statusline+=\ \ \ %l:%c              " current column

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle = 3

" Set netrw window size
let g:netrw_winsize = -20

" Change directory to the current buffer when opening files.
set autochdir

" Let YCM read tags from Ctags file
let g:ycm_collect_identifiers_from_tags_files = 1
" Default 1, just ensure
let g:ycm_use_ultisnips_completer = 1
" Completion for programming language's keyword
let g:ycm_seed_identifiers_with_syntax = 1
" Completion in comments
let g:ycm_complete_in_comments = 1
" Completion in string
let g:ycm_complete_in_strings = 1
" Set python interpreter
let g:ycm_path_to_python_interpreter = "/usr/bin/python"



" autoclose info split
autocmd CompleteDone * pclose

" use // comments instead of /* */
let g:DoxygenToolkit_commentType = "C++"

"let g:lightline = {
"    \ 'colorscheme': '16color',
"    \ 'separator': { 'left': '', 'right': '' },
"    \ 'subseparator': { 'left': '', 'right': '' }
"    \}

" SLIMV
let g:lisp_rainbow=1
let g:paredit_mode=0

" latex
let g:livepreview_previewer = 'zathura'

" vim-slime
let g:slime_target = "tmux"
