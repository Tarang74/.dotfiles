return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "autopep8" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				json = { "jq" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
				astro = { "prettierd", "prettier" },
				c = { "clang-format" },
				h = { "clang-format" },
				tex = { "latexindent" },
				terraform = { "terraform_fmt" },
			},

			formatters = {
				latexindent = {
					command = "latexindent",
					args = {
						"-m",
					},
					stdin = true,
				},
				terraform_fmt = { command = "terraform", args = { "fmt", "-" }, stdin = true },
			},
		})
	end,
}
