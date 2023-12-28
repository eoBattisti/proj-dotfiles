
local function custom_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file
      api.node.open.edit()
      -- Close the tree if file was opened
      api.tree.close()
    end
  end

-- open as vsplit on current node
  local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file as vsplit
      api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
  end
  -- global
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

  -- on_attach
  vim.keymap.set("n", "<CR>", edit_or_open,       opts("Close Directory"))
  vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
  vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
  vim.keymap.set("n", "e", api.tree.close,        opts("Close"))
  vim.keymap.set("n", "E", api.tree.collapse_all, opts("Collapse All"))
  vim.keymap.set("n", "a", api.fs.create,    opts("Create"))
  vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "d", api.fs.remove,    opts("Delete"))
  vim.keymap.set("n", "r", api.fs.rename,    opts("Rename"))
  vim.keymap.set("n", "R", api.tree.reload,  opts("Refresh"))
  vim.keymap.set("n", "x", api.fs.cut,       opts("Cut"))
  vim.keymap.set("n", "p", api.fs.paste,     opts("Paste"))
  vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))

end

local opts = {
  disable_netrw = true,
  sort = {
    sorter = "case_sensitive"
  },
  view = {
    width = 30,
    centralize_selection = true,
    side = "right",
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_label = ":t",
    indent_width = 2,
    indent_markers = {
      enable = true
    },
    icons = {
        glyphs = {
          default = "󰦨",
          symlink = "",
          folder = {
            arrow_open = "󱞩",
            arrow_closed = "󱦰",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",}
      }
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      ".git",
      "node_modules",
      ".cache",
      "__pycache__",
      "venv",
      "env"
    }
  },
  on_attach = custom_on_attach
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
   require("nvim-tree").setup(opts)
  end,
}
