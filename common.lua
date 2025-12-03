-- включить управление мышью
vim.g.mouse = 'a'
vim.opt.encoding="utf-8"
-- выключаем своп файла
vim.opt.swapfile = false

-- устанавливаем настройки табуляции и отступов
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = false  -- Use tabs, not spaces (like Go)

vim.opt.fileformat = "unix"

vim.o.foldlevel = 20
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- базовые номера строк (могут быть переопределены кастомной колонкой)
vim.opt.number = true
vim.opt.signcolumn = "yes"  -- колонка для breakpoints, git signs, diagnostics


