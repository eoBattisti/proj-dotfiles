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
    -- {
    --   dir="/home/battisti/Documentos/open-source-projects/cmp-pypi",
    --   -- "vrslev/cmp-pypi",
    --   dependencies = { "nvim-lua/plenary.nvim" },
    --   ft = "toml",
    --   opts = {
    --     pypi_sources = {
    --       { name = "pypi", url = "https://pypi.org/simple" },
    --       { name = "testpypi", url = "https://test.pypi.org/simple" },
    --     }
    --   }
    -- }
  },
  config = function()
    require("battisti.snippets")

    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    vim.opt.shortmess:append "c"

    local cmp = require("cmp")
    local cmp_insert_behaviour = { behavior = cmp.SelectBehavior.Insert, select = true }
    local cmp_select_behaviour = { behavior = cmp.SelectBehavior.Select }


    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
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
        fields = { "kind", "abbr", "menu" },
        format = function (entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

          -- Source name
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
            nvim_lua = "[Lua]",
            cody = "[Cody]",
            lazydev = "[LazyDev]",
            pypi = "[PyPI]"
          })[entry.source.name]

          return vim_item
        end
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select_behaviour),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select_behaviour),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm(cmp_insert_behaviour),
        ["<CR>"] = cmp.mapping.confirm(cmp_insert_behaviour),
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select_behaviour),
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    })
  end
}
