return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
	enabled = false,
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
      },
      panel = {
        enabled = false
      }
    })

    vim.keymap.set("i", "<S-Tab>", function()
      local suggestions = require("copilot.suggestion")
      if suggestions.is_visible() then
        suggestions.accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
      end
    end, { silent = true })
  end,
}
