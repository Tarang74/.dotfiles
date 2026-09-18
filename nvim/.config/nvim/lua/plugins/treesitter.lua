return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "regex", "javascript", "html", "python", "rust", "latex", "terraform", "prisma" },
			auto_install = true,
      sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
      fold = { enable = true }
		})
	end,
}
