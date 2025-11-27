-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local cursor_light = require('cursor-light')

-- OR setup with some options
require("nvim-tree").setup(
  vim.tbl_deep_extend('force',
    cursor_light.nvim_tree_config(),
    {
      sort = {
        sorter = "case_sensitive",
      },
      filters = {
        dotfiles = true,
      },
    }
  )
)
