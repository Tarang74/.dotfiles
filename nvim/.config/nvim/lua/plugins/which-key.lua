return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = "All Keymaps (which-key)",
			},
		},
	},
	{ "echasnovski/mini.nvim", version = "*" },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
}
