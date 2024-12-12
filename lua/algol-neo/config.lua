local M = {}

M.defaults = {
	variant = "light",
}

M.options = M.defaults

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})

	-- Validate variant
	if M.options.variant ~= "light" and M.options.variant ~= "dark" then
		vim.notify("Invalid variant. Using light variant.", vim.log.levels.WARN)
		M.options.variant = "light"
	end

	return M.options
end

return M
