local M = {
	path = vim.fn.getcwd(),
}

function M.set(path)
	M.path = path
end

function M.get()
	return M.path
end

return M
