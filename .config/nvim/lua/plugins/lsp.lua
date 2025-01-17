-- TODO: Make it lazy friendly as in the docs:
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/lazy-loading-with-lazy-nvim.md

-- TODO: Styles and formatting to a better cmp:
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#change-formatting-of-completion-item

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },


    {
      'folke/lazydev.nvim',
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local lsp = require("lsp-zero")

    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    lsp.preset("recommended")
    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }
      vim.keymap.set(
        "n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "Go to definition" }
      )
      vim.keymap.set(
        "n", "gD", function() vim.lsp.buf.declaration() end,
        { buffer = bufnr, remap = false, desc = "Go to declaration" }
      )
      vim.keymap.set(
        "n", "K", function() vim.lsp.buf.hover() end,
        { buffer = bufnr, remap = false, desc = "Hover LSP Buffer" }
      )
      vim.keymap.set(
        "n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "Toggle diagnostics float window" }
      )
      vim.keymap.set(
        "n", "[d", function() vim.diagnostic.goto_next() end,
        { buffer = bufnr, remap = false, desc = "Go to next diagnostic" }
      )
      vim.keymap.set(
        "n", "]d", function() vim.diagnostic.goto_prev() end,
        { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" }
      )
      vim.keymap.set(
        "n", "<leader>f", function() vim.lsp.buf.format() end,
        { buffer = bufnr, remap = false, desc = "Formats the current buffer" }
      )
      vim.keymap.set(
        "n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "List buffer code actions" }
      )
      vim.keymap.set(
        "n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = "List references" }
      )
      vim.keymap.set(
        "n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "Rename buffer references" }
      )
    end)

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "ruff", "yamlls", "bashls",
        "clangd", "dockerls", "docker_compose_language_service",
        "html", "jsonls", "lua_ls", "marksman"
      },
      handlers = {
        lsp.default_setup,
      },
      capabilities = capabilities,
    })
  end,
}
