return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',

  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      file_ignore_patterns = { "%.git/.", "node_modules" },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set(
      'n', '<leader>K', builtin.keymaps,
      { desc = "Telescope list keymaps" }
    )
    vim.keymap.set(
      'n', '<leader>sf', function()
        builtin.find_files({ hidden = true })
      end,
      { desc = "Telescope find files" }
    )
    vim.keymap.set(
      'n', '<leader>st', builtin.live_grep,
      { desc = "Telescope grep string" }
    )
    vim.keymap.set(
      'n', '<leader>sb', builtin.buffers,
      { desc = "Telescope list buffer" }
    )
    vim.keymap.set(
      'n', '<leader>sh', builtin.help_tags,
      { desc = "Telescope list help tags" }
    )
  end,
}
