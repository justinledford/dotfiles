vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undo')
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.laststatus = 2
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fixeol = false
vim.opt.hidden = true
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
vim.g.mapleader = " "
vim.g.markdown_fenced_languages = { 'python', 'bash=sh', 'c', 'cpp', 'verilog', 'systemverilog' }
