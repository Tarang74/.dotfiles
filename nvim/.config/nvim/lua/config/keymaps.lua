-- UI & windows ---------------------------------------------------------------
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true, desc = "Open Lazy" })
vim.keymap.set("n", "<leader>r", "<cmd>restart<CR>", { silent = true, desc = "Restart Neovim" })
vim.keymap.set("n", "<leader>D", ":lua Snacks.dashboard()<CR>", { silent = true, desc = "Open Snacks Dashboard" })
vim.keymap.set(
	"n",
	"<leader>e",
	":lua Snacks.explorer({ cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Open Snacks Explorer" }
)

-- Buffers & tabs -------------------------------------------------------------
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.tabnew()
end, { desc = "Create new tab" })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>X", "<cmd>bdelete!<CR>", { desc = "Force close buffer" })

-- Files & pickers ------------------------------------------------------------
-- Root directory used by pickers
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

-- Find files
vim.keymap.set(
	"n",
	"<leader>ff",
	":lua Snacks.dashboard.pick('files', { hidden = true, cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Find files" }
)
vim.keymap.set(
	"n",
	"<leader>fF",
	":lua Snacks.dashboard.pick('files', { hidden = true })<CR>",
	{ silent = true, desc = "Find files everywhere" }
)

-- Live grep
vim.keymap.set(
	"n",
	"<leader>fg",
	":lua Snacks.dashboard.pick('live_grep', { cwd = require('state.snacks_dir').get() })<CR>",
	{ silent = true, desc = "Live grep" }
)
vim.keymap.set("n", "<leader>fG", ":lua Snacks.dashboard.pick('live_grep')<CR>", { desc = "Live grep everywhere" })

-- LSP & diagnostics ----------------------------------------------------------
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Toggle diagnostics
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle diagnostics" })

-- Toggle inlay hints
vim.keymap.set("n", "<leader>ih", function()
	vim.g.inlay_hints_enabled = not vim.g.inlay_hints_enabled
	vim.lsp.inlay_hint.enable(vim.g.inlay_hints_enabled)
end, { desc = "Toggle inlay hints" })

-- Formatting -----------------------------------------------------------------
-- Format file
vim.keymap.set("n", "<leader>F", function()
	require("conform").format({ async = true })
end, { desc = "Format file" })

-- Format selection
vim.keymap.set("v", "<leader>F", function()
	require("conform").format({
		async = true,
		range = {
			start = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, { desc = "Format selection" })

-- View toggles ---------------------------------------------------------------
-- Word wrap
vim.keymap.set("n", "<leader>z", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

-- EOL/whitespace markers
vim.opt.listchars = { eol = "↲", tab = "→ ", trail = "·", nbsp = "␣" }
vim.keymap.set("n", "<leader>$", function()
	vim.opt.list = not vim.opt.list:get()
	vim.notify("EOL markers " .. (vim.opt.list:get() and "ON" or "OFF"))
end, { desc = "Toggle EOL markers" })

-- Inline math/image rendering
vim.keymap.set("n", "<leader>im", function()
	local img = Snacks.config.image
	local on = not img.math.enabled
	img.math.enabled = on
	img.doc.inline = on
	img.doc.float = on
	vim.cmd("edit")
	vim.notify("Inline math: " .. (on and "on" or "off"))
end, { silent = true, desc = "Toggle inline math rendering" })

-- Editing --------------------------------------------------------------------
-- Select all (charwise)
vim.keymap.set("n", "<leader>a", "<cmd>normal! gg^vG$<CR>", { desc = "Select all (visual)", silent = true })
vim.keymap.set("v", "<leader>a", "<Esc><cmd>normal! gg^vG$<CR>", { desc = "Select all (visual)", silent = true })

-- Select all (linewise)
vim.keymap.set("n", "<leader>A", "<cmd>normal! ggVG<CR>", { desc = "Select all (visual line)", silent = true })
vim.keymap.set("v", "<leader>A", "<Esc><cmd>normal! ggVG<CR>", { desc = "Select all (visual line)", silent = true })

-- Move lines up/down (Option/Alt)
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })

-- Comments -------------------------------------------------------------------
vim.keymap.del("n", "gc")
vim.keymap.del("n", "gcc")
vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment on selection" })
vim.keymap.set("x", "gC", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment on lines" })
vim.keymap.set("x", "gb", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle block comment on selection" })
vim.keymap.set("x", "gB", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle block comment on lines" })

-- LaTeX ----------------------------------------------------------------------
-- Build: figures (if make_figures.sh exists) then latexmk. Runs silently;
-- only opens a terminal split with the log if the build fails.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function(ev)
		vim.keymap.set("n", "<leader>b", function()
			local root = vim.fs.root(0, "make_figures.sh")
			local figures = root and "bash make_figures.sh tikz figures && " or ""
			local cmd = figures
				.. "latexmk -xelatex -shell-escape -file-line-error "
				.. "-interaction=nonstopmode -halt-on-error -synctex=1 "
				.. vim.fn.shellescape(vim.fn.expand("%:p"))
			local cwd = root or vim.fn.expand("%:p:h")
			vim.notify("Building LaTeX...", vim.log.levels.INFO)
			local out = {}
			local function collect(_, data)
				if data then
					for _, line in ipairs(data) do
						out[#out + 1] = line
					end
				end
			end
			vim.fn.jobstart(cmd, {
				cwd = cwd,
				stdout_buffered = true,
				stderr_buffered = true,
				on_stdout = collect,
				on_stderr = collect,
				on_exit = function(_, code)
					if code == 0 then
						vim.notify("LaTeX build succeeded", vim.log.levels.INFO)
						return
					end
					-- Failure: show log in a scratch split
					vim.cmd("botright 15split | enew")
					local buf = vim.api.nvim_get_current_buf()
					vim.bo[buf].buftype = "nofile"
					vim.bo[buf].bufhidden = "wipe"
					vim.api.nvim_buf_set_lines(buf, 0, -1, false, out)
					vim.notify("LaTeX build failed", vim.log.levels.ERROR)
					vim.cmd.wincmd("p")
				end,
			})
		end, { buffer = ev.buf, desc = "Build LaTeX", silent = true })
	end,
})
