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

-- nvim-treesitter stores queries under its runtime/ directory, so add it explicitly.
-- Это критично для Neovim 0.11+, чтобы встроенный foldexpr нашел folds.scm
local ts_runtime = vim.fn.expand("~/.local/share/nvim/plugged/nvim-treesitter/runtime")
if vim.fn.isdirectory(ts_runtime) == 1 then
    vim.opt.runtimepath:append(ts_runtime)
end

-- Настройка сворачивания (folding) через Treesitter
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = '1'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "typescript", "typescriptreact", "javascript", "javascriptreact", "tsx", "lua", "rust", "python" },
  callback = function(args)
    -- Сначала запускаем парсер
    vim.treesitter.start(args.buf)
    -- Затем выставляем метод фолдинга для окна
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

-- Disable standard line numbers (we use statuscolumn for better control or just don't want them)
vim.opt.number = false
vim.opt.relativenumber = false

-- Sign column for breakpoints, git signs, diagnostics
vim.opt.signcolumn = "yes"
