return {
  'theprimeagen/harpoon',
  branch = "harpoon2",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        key = function()
          return vim.loop.cwd()
        end
      }
    })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add file to Harpoon list" })

    vim.keymap.set("n", "<C-a>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon menu" })

    vim.keymap.set("n", "<C-q>", function()
      harpoon:list():prev()
    end, { desc = "Go to previous file in Harpoon list" })

    vim.keymap.set("n", "<C-e>", function()
      harpoon:list():next()
    end, { desc = "Go to next file in Harpoon list" })
  end
}
