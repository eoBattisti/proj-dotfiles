return {
	'nvim-mini/mini.files',
	version = "*",
	config = function(_, opts)
		require('mini.files').setup(opts)
	end,
	opts = {
    options = {
      use_as_default_explorer = true,
    },
	},
	keys = {
		{ 
			"<leader>e",  
			function() require("mini.files").open(vim.uv.cwd(), true) end,
			mode = "n",
			desc = "Open mini.files in the (cwd)", 
		},
		{
			"<leader>E",  
			function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
			mode = "n",
			desc = "Open mini.files (Directory of current file)", 
		}
 }
}
