-- Switch splits
vim.keymap.set(
  "n",
  "<C-X>",
  "<C-W><C-X>",
  { noremap = true }
)

-- Open dir of current file
vim.keymap.set(
  "n",
  "-",
  ":Oil<cr>"
)

-- Delete current buffer
vim.keymap.set(
  "n",
  "<Leader>bd",
  ":bp|bd<Space>#<cr>",
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
vim.keymap.set(
  "n",
  "<CR>",
  ":noh<CR><CR>",
  { noremap = true }
)

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

-- Apply fix
vim.keymap.set(
  "n",
  "<Leader>ca",
  vim.lsp.buf.code_action,
  { noremap = true }
)

-- Show diagnostics
vim.keymap.set(
  "n",
  "<Leader>t",
  ":Trouble diagnostics toggle<CR>",
  { noremap = true }
)

-- fzf git files
vim.keymap.set(
  "n",
  "<Leader>o",
  ":GFiles<CR>",
  { noremap = true }
)
-- fzf buffers
vim.keymap.set(
  "n",
  "<Leader>b",
  ":Buffers<CR>",
  { noremap = true }
)

-- format
vim.keymap.set(
  "n",
  "<Leader>f",
  vim.lsp.buf.format,
  { noremap = true }
)

-- open vertical git diff split
vim.keymap.set(
  "n",
  "<Leader>gd",
  ":Gvdiffsplit ",
  { noremap = true }
)

-- open 3-way diff split
vim.keymap.set(
  "n",
  "<Leader>g3",
  ":Gdiffsplit!<CR>",
  { noremap = true }
)

-- open vertical diff split
vim.keymap.set(
  "n",
  "<Leader>d",
  ":vert diffsplit ",
  { noremap = true }
)

-- open vertical help split
vim.keymap.set(
  "n",
  "<Leader>vh",
  ":vert help ",
  { noremap = true }
)

vim.keymap.set({ "i" }, "<Tab>", function()
  require("luasnip").jump(1)
end, { silent = true })

vim.keymap.set({ "i" }, "<S-Tab>", function()
  require("luasnip").jump(-1)
end, { silent = true })

vim.keymap.set(
  "n",
  "<Leader>gt",
  function()
    require("config.funcs").create_test_file()
  end)

-- show references
vim.keymap.set(
  "n",
  "<Leader>r",
  vim.lsp.buf.references)
