local utils = require('config.utils')

local M = {}

function M.create_test_file()
  local abspath = vim.fn.expand("%:p")
  local test_filepath = abspath:gsub(".h$", "_test.cc")
  if vim.fn.filereadable(test_filepath) == 1 then
    print(test_filepath .. " already exists")
    return
  end
  local f = io.open(test_filepath, "w")
  if f then
    local include_path = utils.get_relpath_from_git(abspath)
    if not include_path then
      include_path = vim.fn.expand("%:t")
    end
    local content = string.format([[
#include "%s"

#include <gtest/gtest.h>

TEST(%s_test, test) {
  EXPECT_TRUE(true);
}]], include_path, vim.fn.expand("%:t:r"))
    f:write(content)
    f:close()
  else
    print("unable to create " .. test_filepath)
  end
end

return M
