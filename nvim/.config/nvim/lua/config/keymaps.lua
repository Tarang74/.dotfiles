-- Shortcuts
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open Lazy" })
vim.keymap.set("n", "<leader>d", ":lua Snacks.dashboard()<CR>", { silent = true, desc = "Open Snacks Dashboard" })
vim.keymap.set(
	"n",
	"<leader>e",
	":lua Snacks.explorer({ cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Open Snacks Explorer" }
)

-- See file diagonistics
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle Diagnostics" })

-- Set snacks directory
vim.keymap.set("n", "<leader>fr", function()
	require("state.snacks_dir").set(vim.fn.expand("%:p:h"))
end, { desc = "Set root directory to current file" })

vim.keymap.set("n", "<leader>fR", function()
	local snacks_dir = require("state.snacks_dir")
	vim.ui.input({
		prompt = "Set root directory",
		default = snacks_dir.get(),
		completion = "dir",
	}, function(input)
		if input and vim.fn.isdirectory(input) == 1 then
			snacks_dir.set(input)
			require("snacks.explorer").open({ cwd = input })
			require("snacks.explorer").open({ cwd = input })
			vim.notify("Snacks directory set to: " .. input)
		elseif input then
			vim.notify("Invalid directory: " .. input, vim.log.levels.ERROR)
		end
	end)
end, { desc = "Modify root directory" })

-- Fuzzy find
vim.keymap.set(
	"n",
	"<leader>ff",
	":lua Snacks.dashboard.pick('files', { hidden = true, cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Find Files" }
)
vim.keymap.set(
	"n",
	"<leader>fF",
	":lua Snacks.dashboard.pick('files', { hidden = true })<CR>",
	{ silent = true, desc = "Find Files Everywhere" }
)

-- Live grep
vim.keymap.set(
	"n",
	"<leader>fg",
	":lua Snacks.dashboard.pick('live_grep', { cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Live Grep" }
)
vim.keymap.set("n", "<leader>fG", ":lua Snacks.dashboard.pick('live_grep')<CR>", { desc = "Live Grep Everywhere" })

-- Format in normal mode
vim.keymap.set("n", "<leader>F", function()
	require("conform").format({ async = true })
end, { desc = "Format File" })

-- Format in visual mode
vim.keymap.set("v", "<leader>F", function()
	require("conform").format({
		async = true,
		range = {
			start = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, { desc = "Format Selection" })

-- Toggle word wrap
vim.keymap.set("n", "<leader>z", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
