return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "autopep8" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                jsx = { "prettierd", "prettier" },
                c = { "clang-format" },
                json = { "prettierd", "prettier" },
                tex = { "latexindent" },
                html = { "prettierd", "prettier" },
                css = { "prettierd", "prettier" }
            },

            formatters = {
                latexindent = {
                    command = "latexindent",
                    args = {
                        "-m",
                    },
                    stdin = false,
                },
            },
        })
    end,
}
