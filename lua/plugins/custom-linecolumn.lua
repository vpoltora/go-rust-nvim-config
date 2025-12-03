local colors = require("cursor-light.colors").palette

local M = {}

function M.setup()
	-- Disable standard line numbers (we use statuscolumn for better control)
	vim.opt.number = false
	vim.opt.relativenumber = false

	-- Enable sign column (for git signs, diagnostics)
	vim.opt.signcolumn = "yes:1"

	-- Custom statuscolumn with centered line numbers and vertical separator (matching Cursor)
	-- Format: sign + small left padding + number + right padding + separator + spacing
	vim.opt.statuscolumn = "%s %4{v:lnum}  %#LineNrSeparator#│%*  "

	-- Highlight for the separator line
	vim.api.nvim_set_hl(0, "LineNrSeparator", { fg = "#E0E0E0", bg = colors.bg })

	-- Highlight for line numbers in statuscolumn
	vim.api.nvim_set_hl(0, "LineNr", { fg = colors.line_number, bg = colors.bg })

	-- Ensure statuscolumn is enabled for normal buffers, disabled for NvimTree
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function()
			if vim.bo.filetype == "NvimTree" then
				vim.wo.statuscolumn = ""
			else
				vim.wo.statuscolumn = "%s %4{v:lnum}  %#LineNrSeparator#│%*  "
			end
		end,
	})
end

return M
