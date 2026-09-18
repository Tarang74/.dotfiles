return {
	"akinsho/bufferline.nvim",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			opts = {
				override_by_extension = {
					tikz = { icon = "", color = "#3D6117", cterm_color = "58", name = "Tex" },
				},
			},
		},
	},
	opts = {
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "snacks_layout_box",
					text = "Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
			show_buffer_close_icons = true,
			separator_style = "slant",
		},
	},
}
