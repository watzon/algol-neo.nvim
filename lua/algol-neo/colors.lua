local M = {}

-- Base colors that don't change
M.colors = {
	white = "#ffffff",
	black = "#000000",
	red = "#ff0000",
	none = "NONE",
}

--- Generate theme colors based on vim.o.background
function M.generate()
	if vim.o.background == "dark" then
		-- Dark theme colors
		M.colors.bg = "#1a1a1a"
		M.colors.fg = "#e4e4e4" -- Brighter main text
		M.colors.grey = "#b4b4b4" -- Per original screenshot
		M.colors.light_grey = "#999999"
		M.colors.comment_grey = "#7c7c7c"
		M.colors.red = "#ff5555"
	else
		-- Light theme colors
		M.colors.bg = "#ffffff"
		M.colors.fg = "#121212"
		M.colors.grey = "#424242"
		M.colors.light_grey = "#666666"
		M.colors.comment_grey = "#707070"
		M.colors.red = "#cc0000"
	end

	return M.colors
end

function M.get_highlights(c)
	return {
		-- Base highlights
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg },

		-- Syntax groups focusing on typography over color
		Comment = { fg = c.comment_grey, italic = true },
		Keyword = { fg = c.fg, bold = true, underline = true },
		Statement = { fg = c.fg, bold = true, underline = true },
		Type = { fg = c.fg, bold = true, underline = true },

		-- Functions and identifiers
		Function = { fg = c.grey, bold = true, italic = true },
		Identifier = { fg = c.grey, bold = true, italic = true },

		-- Strings and constants
		String = { fg = c.grey, italic = true },
		Character = { fg = c.grey, italic = true },
		Number = { fg = c.grey, bold = true, italic = true },
		Boolean = { fg = c.grey, bold = true, italic = true },
		Float = { fg = c.grey, bold = true, italic = true },

		-- Operators and punctuation
		Operator = { fg = c.fg, bold = true },
		Delimiter = { fg = c.grey },

		-- Special syntax elements
		Special = { fg = c.grey, bold = true, italic = true },
		SpecialChar = { fg = c.grey, bold = true, italic = true },
		SpecialComment = { fg = c.comment_grey, bold = true, italic = false },

		-- Keywords and control flow
		Conditional = { fg = c.fg, bold = true, underline = true },
		Repeat = { fg = c.fg, bold = true, underline = true },
		Label = { fg = c.fg, bold = true, underline = true },
		Exception = { fg = c.fg, bold = true, underline = true },

		-- Messages and diagnostics
		Error = { sp = c.red, underline = true },
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.grey, bold = true },

		-- UI elements
		LineNr = { fg = c.light_grey },
		SignColumn = { bg = c.bg },
		VertSplit = { fg = c.grey },
		StatusLine = { fg = c.fg, bg = c.bg },
		StatusLineNC = { fg = c.grey, bg = c.bg },
		Visual = { bg = c.light_grey, fg = c.bg },
		Search = { bg = c.light_grey, fg = c.bg },
		IncSearch = { bg = c.grey, fg = c.bg },
		MatchParen = { bold = true, underline = true },

		-- Menus and popups
		Pmenu = { fg = c.fg, bg = c.bg },
		PmenuSel = { fg = c.bg, bg = c.grey },
		PmenuSbar = { bg = c.light_grey },
		PmenuThumb = { bg = c.grey },

		-- TreeSitter specific
		["@keyword"] = { fg = c.fg, bold = true, underline = true },
		["@string"] = { fg = c.grey, italic = true },
		["@function"] = { fg = c.grey, bold = true, italic = true },
		["@comment"] = { fg = c.comment_grey, italic = true },
		["@variable"] = { fg = c.fg },
		["@constant"] = { fg = c.grey, bold = true, italic = true },
		["@property"] = { fg = c.grey },
		["@parameter"] = { fg = c.fg },
	}
end

return M
