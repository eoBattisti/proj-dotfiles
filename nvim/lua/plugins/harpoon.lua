local opts = {
  save_on_toggle = true,
}
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

     vim.keymap.set("n", "<leader>a",function ()
       harpoon:list():append()
     end)

     vim.keymap.set("n", "<C-a>", function ()
       harpoon.ui:toggle_quick_menu(harpoon:list())
     end)

     vim.keymap.set("n", "<C-q>", function ()
       harpoon:list():prev()
     end)

     vim.keymap.set("n", "<C-e>", function ()
       harpoon:list():next()
     end)

  end
}


