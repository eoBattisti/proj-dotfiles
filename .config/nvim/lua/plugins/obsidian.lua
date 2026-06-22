return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
    "BufReadPre /home/battisti/notes/*.md",
    "BufNewFile /home/battisti/notes/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
	---@module 'obsidian'
	---@type obsidian.config
  opts = {
		legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/notes/Corujinha/",
      },
    },
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
			create_new = false,
		},
		new_notes_location = "current_dir",
  },
	keys = {
		{ "<leader>on", "<CMD>Obsidian new<CR>", desc = "[O]bsidian [N]ew note"},
		{ "<leader>oh", "<CMD>Obsidian help<CR>", desc = "[O]bsidian [H]elp"},
		{ "<leader>ot", "<CMD>Obsidian today<CR>", desc = "[O]bsidian [T]oday - open/create a new daily note"},
		{ "<leader>os", "<CMD>Obsidian search<CR>", desc = "[O]bsidian [S]earch" },
		{ "<leader>otg", "<CMD>Obsidian tags<CR>", desc = "[O]bsidian [T]a[g]s" },
		{ "<leader>obl", "<CMD>Obsidian backlinks<CR>", desc = "[O]bsidian [B]ac[l]inks" },
		{ "<leader>ofl", "<CMD>Obsidian follow_link vsplit<CR>", desc = "[O]bsidian [F]ollow [L]ink" },
		{ "<leader>ol", "<CMD>Obsidian links<CR>", desc = "[O]bsidian [L]inks" },
		{ "<leader>orn", "<CMD>Obsidian rename<CR>", desc = "[O]bsidian [R]ename" },
		{ "<leader>ox", "<CMD>Obsidian toggle_checkbox<CR>", desc = "[O]bsidian Toggle checkbox" },
		{ "<leader>ol", "<CMD>Obsidian link<CR>", desc = "[O]bsidian [L]ink - Link visual selection to a note", mode = 'v' },
		{ "<leader>onl", "<CMD>Obsidian new_link<CR>", desc = "[O]bsidian [N]ew [L]ink - Create a new note an link it to an inline visual selection to a note", mode = 'v' },
	},
}
