vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Exit buffer"} )
vim.keymap.set("n", "<Esc>", vim.cmd.noh)

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostics [Q]uickfix list" })
vim.keymap.set("n", "<A-j>", "<Cmd>cnext<CR>", { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<A-k>", "<Cmd>cprev<CR>", { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<A-q>", "<Cmd>cclose<CR>", { desc = "[Q]uit the diagnostics" })


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "cs\"", 'ciw\"\"<Esc>P', { desc = "Surround with double quotes" })
vim.keymap.set("n", "cs\'", 'ciw\'\'<Esc>P', { desc = "Surround with single quotes" })
vim.keymap.set("n", "cs(", 'ciw()<Esc>P', { desc = "Surround with parentheses" })
vim.keymap.set("n", "cs[", 'ciw[]<Esc>P', { desc = "Surround with square brackets" })
vim.keymap.set("n", "cs{", 'ciw{}<Esc>P', { desc = "Surround with curly brackets" })
vim.keymap.set("n", "cs<", 'ciw<><Esc>P', { desc = "Surround with angle brackets" })
