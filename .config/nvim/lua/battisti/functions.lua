PRINT = function(v)
  print(vim.inspect(v))
end

local save_and_exec = function()
  vim.cmd("silent! write")
  vim.cmd("lua require('plen e'")
end
