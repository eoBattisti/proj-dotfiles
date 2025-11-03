return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufReadPost",
    opts = {},
    keys = {
      { "<leader>t", "<cmd>TodoQuickFix<CR>", desc = "List all comments" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Jump to next comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Jump to previous comment" },
    },
}
