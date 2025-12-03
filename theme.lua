-- vim.cmd.colorscheme("bluloco-light")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("dayfox")
-- vim.opt.background = "dark"
-- vim.cmd.colorscheme("gruvbox-flat")
-- vim.cmd.colorscheme("rose-pine")
-- vim.o.background = "light"

-- previous 
vim.cmd.colorscheme("gruvbox")
vim.o.background = "light"

-- previous catppuccin
-- vim.cmd.colorscheme("catppuccin-latte")
-- vim.o.background = "light"

-- active - Cursor Light theme (using packaged version)
require('cursor-light').setup({
  ui = false, -- UI customizations moved to custom-linecolumn.lua
  integrations = {
    lspsaga = true,
    nvim_tree = false, -- disabled to prevent column manipulations
  },
})
vim.cmd.colorscheme('cursor-light')

