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
    vim.keymap.set('n', '<leader>K', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>sf', function ()
      builtin.find_files({hidden=true})
    end , {})
    vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
  end,
}
