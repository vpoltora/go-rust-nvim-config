-- Disable standard line numbers (we use statuscolumn for better control)
vim.opt.number = false
vim.opt.relativenumber = false

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

-- Font settings (matching Cursor)
vim.opt.guifont = "JetBrains Mono:h13"

-- Cursor settings (matching Cursor - solid cursor)
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Enable sign column (for git signs, diagnostics)
vim.opt.signcolumn = "yes:1"

-- Custom statuscolumn with centered line numbers and vertical separator (matching Cursor)
-- Format: sign + small left padding + number + right padding + separator + spacing
vim.opt.statuscolumn = "%s %4{v:lnum}  %#LineNrSeparator#│%*  "

-- Highlight for the separator line
vim.api.nvim_set_hl(0, 'LineNrSeparator', { fg = '#E0E0E0', bg = '#FCFCFC' })

-- Highlight for line numbers in statuscolumn
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#999999', bg = '#FCFCFC' })

-- Global statusline for cleaner layout
vim.opt.laststatus = 3

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


