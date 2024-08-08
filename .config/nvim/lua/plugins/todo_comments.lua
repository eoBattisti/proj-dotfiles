return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {}

        vim.keymap.set(
          "n", "<leader>t", "<cmd>TodoTelescope<CR>",
          { noremap = true, silent = true, desc = "List all comments" }
        )

        vim.keymap.set("n", "]t", function ()
          require("todo-comments").jump_next()
        end, { desc = "Jump to next comment"})

        vim.keymap.set("n", "[t", function ()
          require("todo-comments").jump_prev()
        end, { desc = "Jump to previous comment"})
    end
}
