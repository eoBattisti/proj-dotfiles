local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {

  -- UI Config
  ui = {
    title = "Lazy Manager",
    border = "rounded",
    size = {
      width = 0.7,
      height = 0.7,
    }
  }
}


require("lazy").setup({
  { import = "plugins" },
}, opts)
