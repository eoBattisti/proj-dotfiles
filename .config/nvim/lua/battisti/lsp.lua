-- Configure diagnostic display
vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
    -- Format diagnostic messages
    format = function(diagnostic)
      return string.format(
        "%s %s",
        diagnostic.message,
        diagnostic.source and ("(" .. diagnostic.source .. ")") or ""
      )
    end,
  },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('ruff')
vim.lsp.enable('basedpyright')
vim.lsp.enable('djlsp')
vim.lsp.enable('django-language-server')
vim.lsp.enable('html')
vim.lsp.enable('bashls')
