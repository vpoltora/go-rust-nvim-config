-- nvim-autopairs configuration
-- GitHub: https://github.com/windwp/nvim-autopairs
-- Современный Lua плагин с поддержкой TreeSitter

local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
  check_ts = true,  -- Использовать TreeSitter для определения контекста
  ts_config = {
    lua = { 'string', 'comment' },      -- В Lua: не добавлять в строках и комментариях
    go = { 'string', 'comment' },       -- В Go: не добавлять в строках и комментариях
    rust = { 'string', 'comment' },     -- В Rust: не добавлять в строках и комментариях
  },
  enable_bracket_in_quote = false,  -- НЕ добавлять скобки внутри кавычек
})

-- Интеграция с cmp (автокомплит)
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)





