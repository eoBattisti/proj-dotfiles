return {
  {
  "ficcdaf/ashen.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.cmd.colorscheme("ashen")
  end
  },
  {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("kanagawa").setup({
      theme = "dragon",
    })
  end
  },
  {
    "sam4llis/nvim-tundra"
  },
}
