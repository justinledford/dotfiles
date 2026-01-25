-- switch to neighboring panes with ctrl+hjkl
for _, v in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set(
    "n",
    string.format("<C-%s>", v),
    string.format("<C-w>%s", v),
    { noremap = true })
end

-- resize panes
local ss = require('smart-splits')
vim.keymap.set('n', '<C-S-h>', ss.resize_left, { noremap = true })
vim.keymap.set('n', '<C-S-j>', ss.resize_down, { noremap = true })
vim.keymap.set('n', '<C-S-k>', ss.resize_up, { noremap = true })
vim.keymap.set('n', '<C-S-l>', ss.resize_right, { noremap = true })

-- TODO: break this out into a utility function
-- TODO: this will squish terminal contents into a single column that can't be restored
local is_maximized = false
local last_layout = nil
local function toggle_maximize()
  if is_maximized then
    if last_layout then
      vim.cmd(last_layout)
    else
      vim.cmd('wincmd =')
    end
    is_maximized = false
  else
    last_layout = vim.fn.winrestcmd()
    vim.cmd('vertical resize | resize')
    is_maximized = true
  end
end
vim.keymap.set('n', '<leader>m', toggle_maximize, { noremap = true})

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

-- fzf
vim.keymap.set(
  "n",
  "<Leader>fz",
  ":FzfLua<CR>",
  { noremap = true }
)

-- format
vim.keymap.set(
  "n",
  "<Leader>f",
  vim.lsp.buf.format,
  { noremap = true }
)

-- open vertical git status
vim.keymap.set(
  "n",
  "<Leader>gs",
  ":vert Git<CR>",
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

-- open shell in horizontal split
vim.keymap.set(
  "n",
  "<Leader>sh",
  ":split | terminal<CR>",
  { noremap = true }
)

-- open shell in vertical split
vim.keymap.set(
  "n",
  "<Leader>sv",
  ":vsplit | terminal<CR>",
  { noremap = true }
)

-- exit terminal mode
vim.keymap.set(
  "t",
  "<C-[>",
  [[<C-\><C-n>]],
  { noremap = true }
)

-- switch to neighboring panes from terminal mode with ctrl+hjkl
for _, v in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set(
    "t",
    string.format("<C-%s>", v),
    string.format("<C-\\><C-n><C-w>%s", v),
    { noremap = true })
end

-- yank path of file in current buffer to default register
vim.keymap.set(
  "n",
  "<Leader>yp",
  function()
    vim.fn.setreg('"', vim.fn.expand("%"))
  end,
  { noremap = true }
)
