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

-- vim.lsp.enable('docker_compose_language_server')
vim.lsp.enable('basedpyright')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('djlsp')
vim.lsp.enable('dockerls')
vim.lsp.enable('gh_actions')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('htmx')
vim.lsp.enable('lua_ls')
vim.lsp.enable('markdown_oxide')
vim.lsp.enable('ruff')
