local utils = require('config.utils')

-- add header guards for header files created in Oil
vim.api.nvim_create_autocmd("User", {
  pattern = { "OilActionsPost" },
  group = vim.api.nvim_create_augroup("HeaderGuard", { clear = true }),
  callback = function(args)
    for _, action in ipairs(args.data.actions) do
      if action.type == "create" and action.entry_type == "file" then
        local filepath = action.url:gsub("^oil://", "")
        if filepath:sub(-2) == ".h" then
          local file = io.open(filepath, "a")
          if file then
            local relpath = utils.get_relpath_from_git(filepath)
            if not relpath then
              relpath = vim.fn.fnamemodify(filepath, ":t")
            end
            local header_guard = "_" .. string.upper(relpath):gsub("[^%w]", "_") .. "_"
            local content = string.format([[
#ifndef %s
#define %s

#endif // %s
            ]], header_guard, header_guard, header_guard)
            file:write(content)
            file:close()
          end
        end
      end
    end
  end
})

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
