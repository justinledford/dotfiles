local M = {}

function M.get_relpath_from_git(filepath)
  local abspath = vim.fn.fnamemodify(filepath, ":p")
  local dir = vim.fn.fnamemodify(filepath, ":h")
  while dir ~= "" and dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      local git_root = dir
      local relpath = abspath:sub(#git_root + 2)
      return relpath
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

return M
