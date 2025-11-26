-- Cursor Light Theme for Neovim
-- Replicated from Cursor IDE theme
-- Font: JetBrains Mono, size 13 (configured separately)

local M = {}

-- Color palette from Cursor Light theme
local colors = {
	-- Main colors
	bg = "#FCFCFC",              -- editor.background
	fg = "#141414",              -- editor.foreground
	bg_sidebar = "#F3F3F3",      -- sideBar.background
	bg_statusline = "#F3F3F3",   -- statusBar.background
	bg_line = "#EDEDED",         -- editor.lineHighlightBackground

	-- Syntax colors
	comment = "#555555",         -- Comments (italic) - approximation of #141414AD
	string = "#9E94D5",          -- Strings (purple)
	keyword = "#B3003F",         -- Keywords (red)
	func = "#DB704B",            -- Functions (orange)
	variable = "#141414",        -- Variables
	constant = "#206595",        -- Constants (blue)
	number = "#206595",          -- Numbers (blue)
	type = "#206595",            -- Types (blue)
	property = "#6049B3",        -- Properties (purple-blue)
	operator = "#555555",        -- Operators - approximation of #141414AD

	-- Special colors
	green = "#1F8A65",           -- Git added, strings in some contexts
	cyan = "#4C7F8C",            -- Cyan
	teal = "#6F9BA6",            -- Built-in functions
	orange = "#DB704B",          -- Functions, warnings
	yellow = "#C08532",          -- Modified files
	red = "#CF2D56",             -- Errors, deleted
	magenta = "#B8448B",         -- Special keywords
	purple = "#9E94D5",          -- Strings
	blue = "#206595",            -- Types, constants
	light_blue = "#3C7CAB",      -- Links

	-- UI colors
	cursor = "#141414",
	selection = "#E8E8E8",       -- approximation of #1414141E
	line_number = "#999999",     -- approximation of #1414147A
	line_number_active = "#555555", -- approximation of #141414AD
	border = "#EEEEEE",          -- approximation of #14141413
	visual = "#F0F0F0",          -- approximation of #14141411
	search = "#B8CDD4",          -- approximation of #6F9BA65C
	error = "#CF2D56",
	warning = "#DB704B",
	info = "#206595",
	hint = "#6F9BA6",

	-- Transparent/alpha colors
	none = "NONE",
}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "light"
	vim.g.colors_name = "cursor-light"

	-- Editor highlights
	local highlights = {
		-- Base
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_sidebar },
		NormalNC = { fg = colors.fg, bg = colors.bg },

		-- Cursor
		Cursor = { fg = colors.bg, bg = colors.cursor },
		CursorLine = { bg = colors.bg_line },
		CursorColumn = { bg = colors.bg_line },
		CursorLineNr = { fg = colors.line_number_active, bold = true },
		LineNr = { fg = colors.line_number },

		-- Selection
		Visual = { bg = colors.visual },
		VisualNOS = { bg = colors.visual },
		Search = { bg = colors.search },
		IncSearch = { bg = colors.search, fg = colors.fg },

		-- UI Elements
		Pmenu = { fg = colors.fg, bg = colors.bg_sidebar },
		PmenuSel = { bg = colors.visual, fg = colors.fg },
		PmenuSbar = { bg = colors.border },
		PmenuThumb = { bg = colors.line_number },
		StatusLine = { fg = colors.line_number, bg = colors.bg_statusline },
		StatusLineNC = { fg = colors.line_number, bg = colors.bg_statusline },
		TabLine = { fg = colors.comment, bg = colors.bg_sidebar },
		TabLineFill = { bg = colors.bg_sidebar },
		TabLineSel = { fg = colors.fg, bg = colors.bg },
		VertSplit = { fg = colors.border },
		WinSeparator = { fg = colors.border },
		
		-- Line number column separator (vertical line after line numbers)
		LineNrSeparator = { fg = "#E0E0E0", bg = colors.bg },

		-- Syntax
		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.constant },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.number },
		Boolean = { fg = colors.teal },
		Float = { fg = colors.number },

		Identifier = { fg = colors.fg },
		Function = { fg = colors.func },

		Statement = { fg = colors.keyword },
		Conditional = { fg = colors.keyword },
		Repeat = { fg = colors.keyword },
		Label = { fg = colors.keyword },
		Operator = { fg = colors.operator },
		Keyword = { fg = colors.keyword },
		Exception = { fg = colors.keyword },

		PreProc = { fg = colors.green },
		Include = { fg = colors.keyword },
		Define = { fg = colors.green },
		Macro = { fg = colors.green },
		PreCondit = { fg = colors.green },

		Type = { fg = colors.type },
		StorageClass = { fg = colors.keyword },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },

		Special = { fg = colors.orange },
		SpecialChar = { fg = colors.orange },
		Tag = { fg = colors.property },
		Delimiter = { fg = colors.fg },
		SpecialComment = { fg = colors.comment, italic = true },
		Debug = { fg = colors.red },

		-- Treesitter
		["@variable"] = { fg = colors.fg },
		["@variable.builtin"] = { fg = colors.teal },
		["@variable.parameter"] = { fg = colors.orange },
		["@variable.member"] = { fg = colors.property },

		["@constant"] = { fg = colors.constant },
		["@constant.builtin"] = { fg = colors.teal },
		["@constant.macro"] = { fg = colors.green },

		["@string"] = { fg = colors.string },
		["@string.escape"] = { fg = colors.green },
		["@string.regex"] = { fg = colors.light_blue },

		["@character"] = { fg = colors.string },
		["@number"] = { fg = colors.number },
		["@boolean"] = { fg = colors.teal },
		["@float"] = { fg = colors.number },

		["@function"] = { fg = colors.func },
		["@function.builtin"] = { fg = colors.teal },
		["@function.macro"] = { fg = colors.green },
		["@function.method"] = { fg = colors.func },

		["@constructor"] = { fg = colors.type },
		["@parameter"] = { fg = colors.orange },

		["@keyword"] = { fg = colors.keyword },
		["@keyword.function"] = { fg = colors.keyword },
		["@keyword.operator"] = { fg = colors.keyword },
		["@keyword.return"] = { fg = colors.keyword },

		["@conditional"] = { fg = colors.keyword },
		["@repeat"] = { fg = colors.keyword },
		["@label"] = { fg = colors.keyword },
		["@operator"] = { fg = colors.operator },
		["@exception"] = { fg = colors.keyword },

		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.teal },
		["@type.qualifier"] = { fg = colors.keyword },

		["@property"] = { fg = colors.property },
		["@field"] = { fg = colors.property },

		["@comment"] = { fg = colors.comment, italic = true },

		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.bracket"] = { fg = colors.fg },
		["@punctuation.special"] = { fg = colors.orange },

		["@tag"] = { fg = colors.property },
		["@tag.attribute"] = { fg = colors.orange },
		["@tag.delimiter"] = { fg = colors.fg },

		["@namespace"] = { fg = colors.type },
		["@module"] = { fg = colors.type },

		-- LSP Semantic Tokens
		["@lsp.type.namespace"] = { fg = colors.type },
		["@lsp.type.type"] = { fg = colors.type },
		["@lsp.type.class"] = { fg = colors.type },
		["@lsp.type.enum"] = { fg = colors.type },
		["@lsp.type.interface"] = { fg = colors.type },
		["@lsp.type.struct"] = { fg = colors.type },
		["@lsp.type.parameter"] = { fg = colors.orange },
		["@lsp.type.variable"] = { fg = colors.fg },
		["@lsp.type.property"] = { fg = colors.property },
		["@lsp.type.enumMember"] = { fg = colors.constant },
		["@lsp.type.function"] = { fg = colors.func },
		["@lsp.type.method"] = { fg = colors.func },
		["@lsp.type.macro"] = { fg = colors.green },
		["@lsp.type.decorator"] = { fg = colors.green },

		-- Diagnostics
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

		-- Git signs
		DiffAdd = { fg = colors.green },
		DiffChange = { fg = colors.yellow },
		DiffDelete = { fg = colors.red },
		DiffText = { fg = colors.yellow, bg = colors.visual },

		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.yellow },
		GitSignsDelete = { fg = colors.red },

		-- Misc
		ErrorMsg = { fg = colors.error },
		WarningMsg = { fg = colors.warning },
		MoreMsg = { fg = colors.info },
		Question = { fg = colors.info },
		Title = { fg = colors.blue, bold = true },
		Directory = { fg = colors.blue },
		MatchParen = { bg = colors.visual },
		Folded = { fg = colors.comment, bg = colors.bg_sidebar },
		FoldColumn = { fg = colors.comment },
		SignColumn = { bg = colors.bg },
		ColorColumn = { bg = colors.bg_line },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
