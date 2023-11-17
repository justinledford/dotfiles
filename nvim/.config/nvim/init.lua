-------------------
------ config
-------------------

-- Set Tab key to insert 2 spaces by default
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Keep undo history
vim.opt.undofile = true
vim.opt.undodir = "$HOME/.nvim/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Always show status line
vim.opt.laststatus = 2

-- Disable text conceali.opt.(e.opt. show quotes in JSON)
vim.opt.conceallevel = 0

-- H.opt.l.opt.t search term
vim.opt.hlsearch = true

-- Set signcolumn always on
vim.opt.signcolumn = "yes"

-- Show line number for current line
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Don't add newline at end of file
vim.opt.fixeol = false

-- Don't prompt to save buffer if switching
vim.opt.hidden = true

-- Set netrw to list style to tree style
vim.g.netrw_liststyle = 3

-- Hide netrw banner
vim.g.netrw_banner = 0

-- Set leader key to space
vim.g.mapleader = " "



-- Switch splits
vim.api.nvim_set_keymap(
  "n",
  "<C-X>",
  "<C-W><C-X>",
  { noremap = true }
)

-------------------
------ mappings
-------------------

-- Open Netrw listing
vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":Explore<cr>",
  { noremap = true }
)

-- Delete current buffer
vim.api.nvim_set_keymap(
  "n",
  "<Leader>bd",
  ":bp\\|bd<Space>#<cr>",
  { noremap = true }
)

-- Change all tabs to spaces
vim.api.nvim_set_keymap(
  "n",
  "<Leader>rt",
  ":retab<cr>",
  { noremap = true }
)

-- Hit enter to clear search highlighting
vim.api.nvim_set_keymap(
  "n",
  "<CR>",
  ":noh<CR><CR>",
  { noremap = true }
)

-- Switch to open buffers
vim.api.nvim_set_keymap(
  "n",
  "K",
  ":bnext<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "J",
  ":bprevious<CR>",
  { noremap = true }
)

-- Reload all buffers
vim.api.nvim_set_keymap(
  "n",
  "<Leader>r",
  ":checkt<cr>",
  { noremap = true }
)

-- ycm
vim.api.nvim_set_keymap(
  "n",
  "<Leader>gt",
  ":YcmCompleter GoTo<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f",
  ":YcmCompleter FixIt<CR>",
  { noremap = true }
)

-- tagbar
vim.api.nvim_set_keymap(
  "n",
  "<Leader>t",
  ":TagbarToggle<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>tj",
  ":TagbarOpen j<CR>",
  { noremap = true }
)

-- fzf
vim.api.nvim_set_keymap(
  "n",
  "<Leader>o",
  ":Files<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>b",
  ":Buffers<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>a",
  ":Ag<CR>",
  { noremap = true }
)

-------------------
------ plugins
-------------------

vim.cmd([[
call plug#begin()

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

Plug 'mcchrish/zenbones.nvim', {'tag': 'v2.0.0'}
Plug 'rktjmp/lush.nvim'

call plug#end()
]])

-------------------
------ plugin settings
-------------------

vim.cmd([[
autocmd CompleteDone * pclose
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_global_ycm_extra_conf = ''

let g:ale_linters = {
\   'python': ['pylint'],
\   'cpp': ['clangtidy'],
\}
let g:ale_virtualtext_cursor = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 1

let g:gutentags_cache_dir = "~/.cache/gutentags"
]])

vim.cmd([[
set termguicolors
set background=light
colorscheme zenwritten
]])
