local colors = require("algol-neo.colors")

local M = {}

local function apply_colors()
	-- Clear existing highlighting
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set colorscheme name
	vim.g.colors_name = "algol-neo"

	-- Generate colors based on background setting
	local palette = colors.generate()
	local highlights = colors.get_highlights(palette)

	-- Apply highlights
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Set terminal colors
	vim.g.terminal_color_0 = palette.black
	vim.g.terminal_color_7 = palette.white
	vim.g.terminal_color_8 = palette.grey
	vim.g.terminal_color_15 = palette.white
end

function M.setup()
	-- Apply colors immediately
	apply_colors()

	-- Set up autocmd to reapply colors when background changes
	vim.api.nvim_create_autocmd("OptionSet", {
		pattern = "background",
		callback = function()
			apply_colors()
		end,
	})
end

return M
