vim.api.nvim_create_user_command(
  "PyModuleCreate", function (opts)
    local module_name = opts.args

    if module_name == "" then
      print("Usage: :PyModuleCreate <module_name>")
      return
    end

    local cmd = string.format("mkdir -p %s && touch %s/__init__.py", module_name, module_name)
    vim.fn.system(cmd)

    if vim.v.shell_error == 0 then
      print("Module '" .. module_name .. "' created successfully.")
    else
      print("Error creating module '" .. module_name .. "'.")
    end

    vim.cmd("edit .")

  end, { nargs = 1 }
)

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "silent! update",
  desc = "Auto save all files on buffer leave or focus lost",
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
  desc = "Check if file changed outside of Neovim on focus gained or buffer enter",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
  desc = "Notify user when file is changed outside of Neovim",
})
