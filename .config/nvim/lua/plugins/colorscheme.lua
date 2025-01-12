return {
  {
  "ficcdaf/ashen.nvim",
  lazy = false,
  priority = 1000,
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
  {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        mocha = {
          rosewater = "#ffd7d9",
          flamingo = "#ffb3b8",
          pink = "#ff7eb6",
          mauve = "#d4bbff",
          red = "#fa4d56",
          maroon = "#ff8389",
          peach = "#ff832b",
          yellow = "#fddc69",
          green = "#42be65",
          teal = "#3ddbd9",
          sky = "#82cfff",
          sapphire = "#78a9ff",
          blue = "#4589ff",
          lavender = "#be95ff",
          text = "#f4f4f4",
          suntext1 = "#e0e0e0",
          subtext0 = "#c6c6c6",
          overlay2 = "#a8a8a8",
          overlay1 = "#8d8d8d",
          overlay0 = "#6f6f6f",
          surface2 = "#525252",
          surface1 = "#393939",
          surface0 = "#262626",
          base = "#000000",
          mantle = "#0b0b0b",
          crust = "#000000"
        },
      }
    })
    vim.cmd.colorscheme "ashen"
  end 
  }
}
