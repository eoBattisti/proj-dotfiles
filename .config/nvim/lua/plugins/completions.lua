return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  priority = 100,
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { "onsails/lspkind.nvim" },

    -- Snippets
    { 'saadparwaiz1/cmp_luasnip' },
    {
      'L3MON4D3/LuaSnip',
      version = "2.*",
      build = "make install_jsregexp"
    },
    { 'rafamadriz/friendly-snippets' },

    -- Plugins
    {
      dir="/home/battisti/Documentos/open-source-projects/cmp-pypi",
      -- "vrslev/cmp-pypi",
      dependencies = { "nvim-lua/plenary.nvim" },
      ft = "toml",
      opts = { 
        pypi_sources = {
          { name = "pypi", url = "https://pypi.org/simple" },
          { name = "testpypi", url = "https://test.pypi.org/simple" },
        }
      }
    }
  },
  config = function()
    require("battisti.snippets")
    

    vim.opt.completeopt = {"menu", "menuone", "noselect"}
    vim.opt.shortmess:append "c"

    local lspkind = require("lspkind")
    lspkind.init({})

    local cmp = require("cmp")
    local cmp_selection = { behavior = cmp.SelectBehavior.Insert }

    cmp.setup({
      fields = { "kind", "abbr", "menu" },
      sources = {
        { name = "nvim_lsp" },
        { name = "cody" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        {
          name = "lazydev",
          group_index = 0,
        },
        {
          name = "pypi",
          keyword_length = 4
        },
      },
      formatting = {
        format = lspkind.cmp_format(),
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_selection),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_selection),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm(cmp_selection),
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_selection),
        ["<S-Tab>"] = cmp.mapping.select_next_item(cmp_selection),
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
          require("luasnip").expand_snippet(args.body)
        end,
      },
    })
  end
}
