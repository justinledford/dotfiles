-- switch to neighboring panes with ctrl+hjkl
local ss = require('smart-splits')
vim.keymap.set('n', '<C-h>', ss.move_cursor_left)
vim.keymap.set('n', '<C-j>', ss.move_cursor_down)
vim.keymap.set('n', '<C-k>', ss.move_cursor_up)
vim.keymap.set('n', '<C-l>', ss.move_cursor_right)

-- resize panes
vim.keymap.set('n', '<A-h>', ss.resize_left)
vim.keymap.set('n', '<A-j>', ss.resize_down)
vim.keymap.set('n', '<A-k>', ss.resize_up)
vim.keymap.set('n', '<A-l>', ss.resize_right)

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
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><cmd>lua require('smart-splits').move_cursor_left()<CR>]], { noremap = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><cmd>lua require('smart-splits').move_cursor_down()<CR>]], { noremap = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><cmd>lua require('smart-splits').move_cursor_up()<CR>]], { noremap = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><cmd>lua require('smart-splits').move_cursor_right()<CR>]], { noremap = true })

-- yank path of file in current buffer to default register
vim.keymap.set(
  "n",
  "<Leader>yp",
  function()
    vim.fn.setreg('"', vim.fn.expand("%"))
  end,
  { noremap = true }
)
