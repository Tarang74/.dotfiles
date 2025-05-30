return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "autopep8" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd" },
				c = { "clang-format" },
			},
		})
	end,
}
