-- Keep track of current directory when opening explorer
local snacks_dir = require("state.snacks_dir")

local snacks = require("snacks.explorer")
local original_open = snacks.open

snacks.open = function(opts)
	opts = opts or {}
	opts.cwd = snacks_dir.get()
	original_open(opts)

	require("state.snacks_dir").set(opts.cwd or vim.fn.getcwd())
end
