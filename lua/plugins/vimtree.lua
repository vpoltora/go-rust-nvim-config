-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Setup nvim-tree without cursor-light integrations
require("nvim-tree").setup({
  view = {
    width = 25,
    side = "left",
  },
  renderer = {
    group_empty = true,
    indent_width = 2,
    indent_markers = {
      enable = false,
    },
    highlight_git = "name",
    highlight_modified = "name",
    icons = {
      git_placement = "before",
      modified_placement = "after",
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
        },
      },
    },
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
  filters = {
    dotfiles = true,
  },
})

