return {
  "ibhagwan/fzf-lua",
  config = function (_, opts)
    local fzf = require("fzf-lua")
    local config = fzf.config
    local actions = fzf.actions
  end,
  keys = {
    { "<leader>sb", "<cmd>FzfLua buffers<cr>", mode = "n", desc = "Find buffers" },
    { "<leader>sf", "<cmd>FzfLua files<cr>", mode = "n", desc = "Find files" },
    { "<leader>sh", "<cmd>FzfLua helptags<cr>", mode = "n", desc = "Find help tags" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>", mode = "n", desc = "Find keymaps" },
    { "<leader>st", "<cmd>FzfLua live_grep<cr>", mode = "n", desc = "Grep string" },
  }
}
