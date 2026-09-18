vim.filetype.add({ extension = { tikz = "tex" } })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "72"

vim.diagnostic.config({
	virtual_lines = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.opt.clipboard = "unnamedplus"

vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.wrap = false

vim.g.inlay_hints_enabled = false
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(vim.g.inlay_hints_enabled, { bufnr = args.buf })
		end
	end,
})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		if not vim.g.inlay_hints_enabled then
			return
		end
		local val = ev.data and ev.data.params and ev.data.params.value
		if val and val.kind == "end" then
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client and client:supports_method("textDocument/inlayHint") then
				for bufnr in pairs(client.attached_buffers) do
					vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		end
	end,
})
