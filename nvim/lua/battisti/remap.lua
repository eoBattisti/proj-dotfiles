vim.g.mapleader = " "
vim.g.doge_doc_standard_python = "google"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Esc>", vim.cmd.noh)
vim.keymap.set("n", "<C-w>j", vim.cmd.vsplit)

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
