-- Indentation and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildignore = {
  "**/node_modules/**",
  "**/coverage/**",
  "**/.idea/**",
  "**/.git/**",
}

-- UI
vim.opt.wrap = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""

vim.opt.list = true
vim.opt.listchars = {
  trail = "⋅",
  tab = "  ",
  extends = "❯",
  precedes = "❮",
}

vim.opt.showbreak = "↪"

vim.opt.ruler = true          -- Set ruler

vim.opt.cursorline = true     -- Highlight current line
vim.opt.cursorcolumn = true   -- Highlight current column
vim.opt.colorcolumn = { 120 } -- Highlight columns
vim.opt.showmatch = true
vim.opt.mat = 2
vim.opt.showtabline = 2

vim.opt.title = true -- Allow vim to set terminal title

vim.opt.termguicolors = true
vim.opt.guifont = "monospace:h17"

-- Autoread files
vim.opt.autoread = true

-- Set encoding
vim.opt.encoding = "utf-8"

-- Clipboard
vim.opt.clipboard = { "unnamed", "unnamedplus" }     -- Copy/paste between vim and other programs.
