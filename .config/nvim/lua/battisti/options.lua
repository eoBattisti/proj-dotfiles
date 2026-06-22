-- create the default undo directory if it does not exists
local undodir = vim.fn.expand("~/.nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- File handling
vim.opt.backup = false																-- disable backup files from being created
vim.opt.writebackup = false														-- disable creating backup files before writing to a buffer
vim.opt.swapfile = false															-- disable swap files for buffers  
vim.opt.undofile = true																-- persists undo history
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir") 		-- undo directory
vim.opt.autoread = true																-- Auto detects when a file was updated outside of vim

-- Indentation and tabs
vim.opt.tabstop = 2																		-- Tab width
vim.opt.shiftwidth = 2 																-- Indent width
vim.opt.shiftround = true															--
vim.opt.autoindent = true															-- Copy the indent of the current line
vim.opt.smartindent = true 														-- Smart auto-indenting

-- Search
vim.opt.ignorecase = true															-- Case insensitve search
vim.opt.smartcase = true															-- Case sensitive if uppercase in search
vim.opt.incsearch = true															-- Show matches while typing
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
vim.opt.winborder = "rounded"

vim.opt.guicursor = ""

vim.opt.list = true
vim.opt.listchars = {
  trail = "⋅",
  tab = "  ",
  extends = "❯",
  precedes = "❮",
}

vim.opt.showbreak = "↪"
vim.opt.showmode = false

vim.opt.ruler = true          -- Set ruler

vim.opt.cursorline = true     -- Highlight current line
vim.opt.cursorcolumn = true   -- Highlight current column
vim.opt.colorcolumn = { 120 } -- Highlight columns
vim.opt.showmatch = true															-- Show matches while typing
vim.opt.mat = 2
vim.opt.showtabline = 2

vim.opt.title = true -- Allow vim to set terminal title

vim.opt.termguicolors = true
vim.opt.guifont = "monospace:h17"

vim.opt.splitright = true
vim.opt.splitbelow = false

-- Autoread files

-- Set encoding
vim.opt.encoding = "utf-8"

-- Clipboard
vim.opt.clipboard = { "unnamed", "unnamedplus" }     -- Copy/paste between vim and other programs.

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
