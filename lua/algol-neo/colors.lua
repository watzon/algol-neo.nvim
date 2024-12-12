local M = {}

-- Base colors that don't change
M.colors = {
	white = "#ffffff",
	black = "#000000",
	none = "NONE",
}

--- Generate theme colors based on vim.o.background
function M.generate()
	if vim.o.background == "dark" then
		-- Dark theme colors with improved contrast
		M.colors.bg = "#1a1a1a"
		M.colors.fg = "#e4e4e4" -- Brighter main text
		M.colors.grey = "#b4b4b4" -- Lighter grey for better visibility
		M.colors.light_grey = "#999999"
		M.colors.comment_grey = "#7c7c7c" -- Distinct color for comments
		M.colors.keyword = "#ededed" -- Bright keywords
		M.colors.strings = "#c2c2c2" -- Strings slightly dimmer than main text
		M.colors.functions = "#d4d4d4" -- Functions stand out
		M.colors.red = "#ff5555"
	else
		-- Light theme colors with improved contrast
		M.colors.bg = "#ffffff"
		M.colors.fg = "#121212" -- Darker main text
		M.colors.grey = "#424242" -- Darker grey for better contrast
		M.colors.light_grey = "#666666"
		M.colors.comment_grey = "#707070" -- Distinct color for comments
		M.colors.keyword = "#000000" -- Bold black keywords
		M.colors.strings = "#383838" -- Darker strings
		M.colors.functions = "#242424" -- Functions stand out
		M.colors.red = "#cc0000"
	end

	return M.colors
end

function M.get_highlights(c)
	return {
		-- Base highlights
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg },

		-- Syntax groups with improved contrast
		Comment = { fg = c.comment_grey, italic = true },
		Keyword = { fg = c.keyword, bold = true },
		Statement = { fg = c.keyword, bold = true },
		Type = { fg = c.keyword, bold = true },

		-- Strong emphasis for important elements
		Function = { fg = c.functions, bold = true },
		Identifier = { fg = c.functions },

		-- Strings and constants
		String = { fg = c.strings, italic = true },
		Character = { fg = c.strings, italic = true },
		Number = { fg = c.functions },
		Boolean = { fg = c.keyword, bold = true },
		Float = { fg = c.functions },

		-- Operators and punctuation
		Operator = { fg = c.fg, bold = true },
		Delimiter = { fg = c.grey },

		-- Special syntax elements
		Special = { fg = c.functions },
		SpecialChar = { fg = c.strings, bold = true },
		SpecialComment = { fg = c.comment_grey, bold = true },
		Debug = { fg = c.red },

		-- Keywords and control flow
		Conditional = { fg = c.keyword, bold = true },
		Repeat = { fg = c.keyword, bold = true },
		Label = { fg = c.keyword, bold = true },
		Exception = { fg = c.keyword, bold = true },

		-- UI elements
		LineNr = { fg = c.light_grey },
		SignColumn = { bg = c.bg },
		VertSplit = { fg = c.grey },
		StatusLine = { fg = c.fg, bg = c.bg },
		StatusLineNC = { fg = c.grey, bg = c.bg },

		-- Selection and search
		Visual = { bg = c.light_grey, fg = c.bg },
		Search = { bg = c.light_grey, fg = c.bg },
		IncSearch = { bg = c.grey, fg = c.bg },
		MatchParen = { bold = true, underline = true },

		-- Menus and popups
		Pmenu = { fg = c.fg, bg = c.bg },
		PmenuSel = { fg = c.bg, bg = c.grey },
		PmenuSbar = { bg = c.light_grey },
		PmenuThumb = { bg = c.grey },

		-- Messages and diagnostics
		Error = { fg = c.red },
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.grey, bold = true },

		-- Git signs and diffs (if used)
		DiffAdd = { fg = c.functions },
		DiffChange = { fg = c.strings },
		DiffDelete = { fg = c.red },
		DiffText = { fg = c.fg, bold = true },

		-- TreeSitter specific (if used)
		["@keyword"] = { fg = c.keyword, bold = true },
		["@string"] = { fg = c.strings, italic = true },
		["@function"] = { fg = c.functions, bold = true },
		["@comment"] = { fg = c.comment_grey, italic = true },
		["@variable"] = { fg = c.fg },
		["@constant"] = { fg = c.functions, bold = true },
		["@property"] = { fg = c.fg },
		["@parameter"] = { fg = c.fg },
	}
end

return M
