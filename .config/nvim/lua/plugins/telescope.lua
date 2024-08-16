return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',

  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      file_ignore_patterns = { '%.git/.', "node_modules" },
      extensions = {
        wrap_results = true,
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        }
      }
    })

    pcall(require("telescope").load_extension "fzf")
    pcall(require("telescope").load_extension "ui-select")

    local builtin = require('telescope.builtin')

    vim.keymap.set(
      'n', '<leader>K', builtin.keymaps,
      { desc = 'Telescope list keymaps' }
    )
    vim.keymap.set(
      'n', '<leader>sf', function()
        builtin.find_files({ hidden = true })
      end,
      { desc = 'Telescope find files' }
    )
    vim.keymap.set(
      'n', '<leader>st', builtin.live_grep,
      { desc = 'Telescope grep string' }
    )
    vim.keymap.set(
      'n', '<leader>sb', builtin.buffers,
      { desc = 'Telescope list buffer' }
    )
    vim.keymap.set(
      'n', '<leader>sh', builtin.help_tags,
      { desc = 'Telescope list help tags' }
    )
  end,
}
