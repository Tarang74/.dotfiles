return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"bashls",
			"jsonls",
			"terraformls",
			"texlab",
			"ts_ls",
			"clangd",
			"eslint",
			"ltex_plus",
			"lua_ls",
			"pylsp",
			"rust_analyzer",
			"prismals",
		},
		automatic_enable = true,
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				vim.lsp.config["lua_ls"] = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				}

				vim.lsp.config["clangd"] = {
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
				}

				vim.lsp.config["texlab"] = {
					settings = {
						texlab = {
							build = {
								executable = "xelatex",
								args = {
									"-shell-escape",
									"-file-line-error",
									"-interaction=nonstopmode",
									"-halt-on-error",
									"-synctex=1",
									"%f",
								},
							},
						},
					},
				}

				vim.lsp.config["ltex_plus"] = {
					settings = {
						ltex = {
							language = "en-AU",
							dictionary = {
								["en-AU"] = {
									"Tarang",
									"Janawalkar",
								},
							},
						},
					},
				}

				vim.lsp.config["rust_analyzer"] = {
					settings = {
						["rust-analyzer"] = {
							inlayHints = {
								enable = true,
							},
						},
					},
				}
			end,
		},
		{
			"mrcjkb/rustaceanvim",
			version = "^9",
			lazy = false,
		},
	},
}
