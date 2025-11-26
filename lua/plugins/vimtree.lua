-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    number = false,
    relativenumber = false,
    signcolumn = "no",
  },
  renderer = {
    group_empty = true,
    indent_width = 2,
    indent_markers = {
      enable = false,
    },
    icons = {
      padding = "  ",  -- Add left padding for icons/text
    },
  },
  filters = {
    dotfiles = true,
  },
})

-- Force disable statuscolumn for NvimTree buffers
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = { "NvimTree", "*" },
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      vim.wo.statuscolumn = ""
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = "no"
    end
  end,
})
