return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig",
			config = function()
				local lspconfig = require("lspconfig")

				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})

				lspconfig.clangd.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--background-index",
						"-j=12",
						"--query-driver=**",
						"--clang-tidy",
						"--all-scopes-completion",
						"--cross-file-rename",
						"--completion-style=detailed",
						"--header-insertion-decorators",
						"--header-insertion=iwyu",
						"--pch-storage=memory",
						"--suggest-missing-includes",
					},
				})
			end,
		},
	},
}
