local function to_snake_case(str)
  return str:gsub("(%u+)(%u%l)", "%1_%2"):gsub("(%l)(%u)", "%1_%2"):lower()
end

vim.api.nvim_create_user_command('NewStruct', function(opts)
  local name = opts.args
  if name == "" then
    print("error: must provide struct name")
    return
  end

  -- TODO

  local h_file = to_snake_case(name) .. ".h"
  local cc_file = to_snake_case(name) .. ".cc"

  local h_lines = vim.split(string.format([[
#pragma once

struct %s {
  %s();
  ~%s();
};]], name, name, name), "\n")


  local cc_lines = vim.split(string.format([[
#include "%s"

%s::%s() {}

%s::~%s() {}]], h_file, name, name, name, name), "\n")


  vim.fn.writefile(h_lines, h_file)
  vim.fn.writefile(cc_lines, cc_file)
end, { nargs = 1 })
