-- NOTE:
-- nvim-treesitter недавно получил "полный несовместимый rewrite".
-- Модуля `nvim-treesitter.configs` больше нет.
-- Новый публичный API: `require('nvim-treesitter')`.

local ts = require('nvim-treesitter')

-- Directory to install parsers and queries to (prepended to runtimepath)
-- Default совпадает, но явно фиксируем поведение.
ts.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

-- Аналог прежнего `ensure_installed`: запускаем установку нужных парсеров.
-- (Асинхронно; не блокирует старт nvim.)
ts.install({
  -- Основные языки из конфига
  'go',
  'rust',
  'lua',
  'python',
  'dart',
  'javascript',
  'typescript',
  'vue',
  'json',
  'jsonc',
  -- Полезные дополнительные
  'bash',
  'c',
  'cpp',
  'css',
  'html',
  'markdown',
  'markdown_inline',
  'vim',
  'vimdoc',
  'yaml',
  'toml',
  'regex',
  'gitignore',
  'git_config',
  'gitcommit',
  'diff',
  'query',
})

-- В новом treesitter хайлайт включает Neovim, а не nvim-treesitter.
-- Безопасно пытаемся стартануть TS для любых буферов, где есть парсер.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

