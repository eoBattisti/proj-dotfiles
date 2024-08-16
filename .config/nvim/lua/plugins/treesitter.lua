local opts = {
  ensure_installed = {"c", "lua", "vim", "vimdoc", "python", "html", "bash"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
