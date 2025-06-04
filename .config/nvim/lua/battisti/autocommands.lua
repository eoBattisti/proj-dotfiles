local augroup_opts = {
  clear = true
}

local autoFormattingGroup = vim.api.nvim_create_augroup("AutoFormatting", augroup_opts)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    desc = "Auto source lua files",
    pattern = "*.lua",
    group = autoFormattingGroup,
    callback = function()
      vim.cmd("silent! write")
      vim.cmd("luafile %")
    end
  }
)

-- vim.api.nvim_create_autocmd(
--   "BufWritePre",
--   {
--     desc = "Auto update Python imports with isort",
--     pattern = "*.py",
--     group = autoFormattingGroup,
--     callback = function()
--       local file_path = vim.fn.expand("%:p")
--       vim.system(
--         { "isort", "--sp", "/home/battisti/.config/python-tools/isort.toml", "--atomic", file_path },
--         {},
--         function(out)
--           if out.code == 0 then
--             vim.schedule(
--               function()
--                 vim.cmd("e!")
--               end
--             )
--           end
--         end)
--     end
--   }
-- )
