-- vim.cmd.colorscheme("bluloco-light")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("dayfox")
-- vim.opt.background = "dark"
-- vim.cmd.colorscheme("gruvbox-flat")
-- vim.cmd.colorscheme("rose-pine")
-- vim.o.background = "light"

-- previous 
-- vim.cmd.colorscheme("gruvbox")
-- vim.o.background = "light"

-- previous catppuccin
-- vim.cmd.colorscheme("catppuccin-latte")
-- vim.o.background = "light"

-- active - Cursor Light theme (using packaged version)
require('cursor-light').setup({
  ui = true,
  integrations = {
    lspsaga = true,
    nvim_tree = true,
  },
})
vim.cmd.colorscheme('cursor-light')

