local utils = require('config.utils')

-- highlight active buffer
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.opt_local.winhighlight = "Normal:Normal,NormalFloat:Normal"
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalFloat,NormalFloat:NormalFloat"
  end,
})

-- enter insert mode on entering terminals
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})
