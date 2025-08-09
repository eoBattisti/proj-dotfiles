return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      preview = {
        scrollbar = false,
      }
    },
    files = {
      cwd_prompt = false,
      prompt = "Files: ",
      previewer = "bat"
    },
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      }
    }
  },
  keys = {
    { "<leader>sb",  "<cmd>FzfLua buffers<cr>",              mode = "n", desc = "Find buffers" },
    { "<leader>sf",  "<cmd>FzfLua files<cr>",                mode = "n", desc = "Find files" },
    { "<leader>sgf", "<cmd>FzfLua git_files<cr>",            mode = "n", desc = "Find files" },
    { "<leader>sh",  "<cmd>FzfLua helptags<cr>",             mode = "n", desc = "Find help tags" },
    { "<leader>sk",  "<cmd>FzfLua keymaps<cr>",              mode = "n", desc = "Find keymaps" },
    { "<leader>st",  "<cmd>FzfLua live_grep<cr>",            mode = "n", desc = "Grep string" },
    { "<leader>sr",  "<cmd>FzfLua lsp_references<cr>",       mode = "n", desc = "Search for references" },
    { "<leader>sr",  "<cmd>FzfLua lsp_document_symbols<cr>", mode = "n", desc = "Search for references" },
  }
}
