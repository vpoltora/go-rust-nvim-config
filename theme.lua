-- Set Gruvbox Light theme by default
local ok, _ = pcall(vim.cmd.colorscheme, "gruvbox")
if not ok then
  vim.notify("Colorscheme 'gruvbox' not found. Please run :PlugInstall to install plugins.", vim.log.levels.WARN)
end
vim.o.background = "light"

local function apply_diff_highlights()
  -- Keep unchanged context neutral and make add/delete clearly distinct.
  vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#1E7F4D", bg = "#D8EDE5" })
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#A73E4A", bg = "#FADFE5" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#F3F3F3" })
  vim.api.nvim_set_hl(0, "DiffText", { fg = "#206595", bold = true, bg = "NONE" })

  -- Side-specific groups used by DiffView hooks for 2-way diffs.
  vim.api.nvim_set_hl(0, "DiffviewDiffChangeAdded", { fg = "#1E7F4D", bg = "#E8F5EE" })
  vim.api.nvim_set_hl(0, "DiffviewDiffTextAdded", { fg = "#1E7F4D", bold = true, bg = "NONE" })
  vim.api.nvim_set_hl(0, "DiffviewDiffChangeRemoved", { fg = "#A73E4A", bg = "#FCECEF" })
  vim.api.nvim_set_hl(0, "DiffviewDiffTextRemoved", { fg = "#A73E4A", bold = true, bg = "NONE" })
end

apply_diff_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_diff_highlights,
})
