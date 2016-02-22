"required for vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set nomodeline
let g:base16_shell_path="/home/justin/.dotfiles/colors/"
let base16colorspace=256
colorscheme base16-deafened-mod

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

" autoclose info split
autocmd CompleteDone * pclose

" use // comments instead of /* */
let g:DoxygenToolkit_commentType = "C++"

let g:lightline = {
    \ 'colorscheme': '16color',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \}
