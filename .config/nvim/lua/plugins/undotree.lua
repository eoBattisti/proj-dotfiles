return {
  'mbbill/undotree',
  event = "VeryLazy",
  config = function()
    vim.keymap.set(
      "n", "<leader><F5>", vim.cmd.UndotreeToggle,
      { desc = "Toggle Undotree" }
    )
  end
}
