-------------------
------ config
-------------------

-- Set Tab key to insert 2 spaces by default
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Keep undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undo')
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

vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})

-- Set leader key to space
vim.g.mapleader = " "

-------------------
------ mappings
-------------------

-- Switch splits
vim.keymap.set(
  "n",
  "<C-X>",
  "<C-W><C-X>",
  { noremap = true }
)

-- Open Netrw listing
vim.keymap.set(
  "n",
  "<leader>e",
  ":Explore<cr>",
  { noremap = true }
)

-- Delete current buffer
vim.keymap.set(
  "n",
  "<Leader>bd",
  ":bp\\|bd<Space>#<cr>",
  { noremap = true }
)

-- Change all tabs to spaces
vim.keymap.set(
  "n",
  "<Leader>rt",
  ":retab<cr>",
  { noremap = true }
)

-- Hit enter to clear search highlighting
--vim.keymap.set(
--  "n",
--  "<CR>",
--  ":noh<CR><CR>",
--  { noremap = true }
--)

-- Switch to open buffers
vim.keymap.set(
  "n",
  "K",
  ":bnext<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "J",
  ":bprevious<CR>",
  { noremap = true }
)

-- Reload all buffers
vim.keymap.set(
  "n",
  "<Leader>r",
  ":checkt<cr>",
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>ca",
  vim.lsp.buf.code_action,
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>t",
  ":TroubleToggle<CR>",
  { noremap = true }
)

-- fzf
vim.keymap.set(
  "n",
  "<Leader>o",
  ":GFiles<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<Leader>b",
  ":Buffers<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "<Leader>a",
  ":Ag<CR>",
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>f",
  vim.lsp.buf.format,
  { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>d",
  ":Gvdiffsplit ",
  { noremap = true }
)

-------------------
------ plugins
-------------------

-- Install packer if its not already
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'christoomey/vim-tmux-navigator'

  use 'ap/vim-buftabline'

  use 'airblade/vim-gitgutter'

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use 'junegunn/fzf.vim'

  use 'tpope/vim-abolish'

  use 'tpope/vim-fugitive'

  use 'mcchrish/zenbones.nvim'
  use 'rktjmp/lush.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jay-babu/mason-null-ls.nvim'

  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        -- don't use icons
        icons = false,
        fold_open = "v",
        fold_closed = ">",
        indent_lines = false,
        signs = {
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = false
      }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-------------------
------ plugin settings
-------------------

vim.cmd([[
set termguicolors
set background=light
colorscheme zenwritten
]])

-- Use mason to install various LSPs, formatters and linters
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'efm',
    'pylsp',
    'verible',
  }
})
require("mason-null-ls").setup({
    ensure_installed = {
      'black',
      'isort',
      'mypy',
    }
})

-- Use nvm-cmp as a completion engine
local cmp = require'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Configure each LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
require "lspconfig".efm.setup {
  init_options = {documentFormatting = true},
  capabilities = capabilities,
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = {
        {formatCommand = 'black --quiet -', formatStdin = true},
        {formatCommand = 'isort --quiet -', formatStdin = true},
        --TODO: get this working
        {lintCommand = 'mypy --show-column-numbers --disallow-untyped-defs', lintStdin = false},
      }
    }
  }
}
require'lspconfig'.pylsp.setup {
  capabilities = capabilities,
}
require'lspconfig'.verible.setup {
  capabilities = capabilities,
}
