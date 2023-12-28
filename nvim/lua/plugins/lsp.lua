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
      { 
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },

      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    },

    config = function()
       local lsp = require("lsp-zero")
       lsp.preset("recommended")

       lsp.on_attach(function(_, bufnr)
           local opts = {buffer = bufnr, remap = false}
           vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
           vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
           vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
           vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
           vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
           vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
           vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
       end)

       require("mason").setup()
       require("mason-lspconfig").setup({
          ensure_installed = { "pyright", "ruff_lsp", "yamlls", "bashls",
                       "clangd", "dockerls", "docker_compose_language_service",
                       "html", "jsonls", "tsserver", "lua_ls", "marksman"
          },
          handlers = {
            lsp.default_setup,
          }
       })

       local cmp = require("cmp")
       local cmp_selection = { behavior = cmp.SelectBehavior.Select }

       cmp.setup({
         fields = { "kind", "abbr", "menu" },
         sources = {
           { name = "nvim_lsp" },
           { name = "nvim_lua" },
           { name = "path" },
           { name = "buffer" },
         },
         formatting = lsp.cmp_format(),
         mapping = {
           ["<C-k>"] = cmp.mapping.select_prev_item(cmp_selection),
           ["<C-j>"] = cmp.mapping.select_next_item(cmp_selection),
           ["<C-d>"] = cmp.mapping.scroll_docs(-4),
           ["<C-f>"] = cmp.mapping.scroll_docs(4),
           ["<C-Space>"] = cmp.mapping.complete(),
           ["<C-e>"] = cmp.mapping.abort(),
           ["<CR>"] = cmp.mapping.confirm({ select = true }),
           ["<Tab>"] = cmp.mapping.select_next_item(cmp_selection),
           ["<S-Tab>"] = cmp.mapping.select_next_item(cmp_selection),
         },
       })
    end,
}
