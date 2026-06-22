vim.g.mapleader = " "

vim.keymap.set('n', '<leader>"', 'ciw"<C-r>""<Esc>')
vim.keymap.set("n", "<Esc>", vim.cmd.noh)

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist, { desc = "Open diagnostics [Q]uickfix list" })
vim.keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", { desc = "Open diagnostics [Q]uickfix list" })
vim.keymap.set("n", "<leader>qa", "<Cmd>caddexpr expand('%') . ':' . line('.') . ':1:' . getline('.')<CR>", { desc = "Open diagnostics [Q]uickfix list" })
vim.keymap.set("n", "<A-j>", "<Cmd>cnext<CR>", { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<A-k>", "<Cmd>cprev<CR>", { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<A-q>", "<Cmd>cclose<CR>", { desc = "[Q]uit the diagnostics" })


vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)"})
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)"})

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })


vim.keymap.set("n", "<leader>vd", function()
  vim.diagnostic.open_float({
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  })
end, { desc = "Toggle diagnostics float window" })

-- Harpoon like bindings

vim.keymap.set("n", "<leader>a", function ()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
end, { desc = "Add current file to the arglist" })

vim.keymap.set("n", "<leader>e", "<Cmd>args<CR>", { desc = "Show all the files in the arglist" })
vim.keymap.set("n", "<leader>n", "<Cmd>n<CR>", { desc = "Go to the next file in the arglist" })
vim.keymap.set("n", "<leader>p", "<Cmd>N<CR>", { desc = "Go to the previous file in the arglist" })


-- LSP keybindings
vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "LSP Go to Definition" })

vim.keymap.set("n", "<leader>vca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })


