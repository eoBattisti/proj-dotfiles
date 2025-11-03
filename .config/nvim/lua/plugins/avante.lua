-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
local avante_code_readability_analysis = [[
  You must identify any readability issues in the code snippet.
  Some readability issues to consider:
  - Unclear naming
  - Unclear purpose
  - Redundant or obvious comments
  - Lack of comments
  - Long or complex one liners
  - Too much nesting
  - Long variable names
  - Inconsistent naming and code style.
  - Code repetition
  You may identify additional problems. The user submits a small section of code from a larger file.
  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
  If there's no issues with code respond with only: <OK>
]]
local avante_optimize_code = 'Optimize the following code'
local avante_explain_code = 'Explain the following code'
local avante_complete_code = 'Complete the following codes written in ' .. vim.bo.filetype
local avante_add_docstring = 'Add docstring to the following codes'
local avante_fix_bugs = 'Fix the bugs inside the following codes if any'
local avante_add_tests = 'Implement tests for the following code'

return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- for example
    provider = "copilot",
    selector = {
      provider = "fzf_lua",

    }
    -- providers = {
    --   claude = {
    --     endpoint = "https://api.anthropic.com",
    --     model = "claude-sonnet-4-20250514",
    --     timeout = 30000, -- Timeout in milliseconds
    --       extra_request_body = {
    --         temperature = 0.75,
    --         max_tokens = 20480,
    --       },
    -- },
    -- },
  },
  keys = {
      {
        '<leader>al',
        function()
          require('avante.api').ask { question = avante_code_readability_analysis }
        end,
        mode = { 'n', 'v' },
        desc = 'Code Readability Analysis(ask)',
      },
      {
        '<leader>ao',
        function()
          require('avante.api').ask { question = avante_optimize_code }
        end,
        mode = { 'n', 'v' },
        desc = 'Optimize Code(ask)',
      },
      {
        '<leader>ax',
        function()
          require('avante.api').ask { question = avante_explain_code }
        end,
        mode = { 'n', 'v' },
        desc = 'Explain Code(ask)',
      },
      {
        '<leader>ac',
        function()
          require('avante.api').ask { question = avante_complete_code }
        end,
        mode = { 'n', 'v' },
        desc = 'Complete Code(ask)',
      },
      {
        '<leader>ad',
        function()
          require('avante.api').ask { question = avante_add_docstring }
        end,
        mode = { 'n', 'v' },
        desc = 'Docstring(ask)',
      },
      {
        '<leader>ab',
        function()
          require('avante.api').ask { question = avante_fix_bugs }
        end,
        mode = { 'n', 'v' },
        desc = 'Fix Bugs(ask)',
      },
      {
        '<leader>au',
        function()
          require('avante.api').ask { question = avante_add_tests }
        end,
        mode = { 'n', 'v' },
        desc = 'Add Tests(ask)',
      },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "folke/snacks.nvim",             -- for input provider snacks
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    }, -- or echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            accept = false,
          },
          panel = {
            enabled = false
          }
        })

        vim.keymap.set("i", "<S-Tab>", function()
          local suggestions = require("copilot.suggestion")
          if suggestions.is_visible() then
            suggestions.accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
          end
        end, { silent = true })
      end,
    }, -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
