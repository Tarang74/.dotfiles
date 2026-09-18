return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = nil,
			opleader = nil,
			mappings = false,
		})
	end,
}
