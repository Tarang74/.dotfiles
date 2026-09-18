return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { size = 10 * 1024 * 1024 },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		image = {
			enabled = true,
			preview = { enabled = false },
			doc = { inline = false, float = false },
			math = { enabled = false },
		},
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
