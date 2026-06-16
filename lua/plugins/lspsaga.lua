
local function saga_finder_to_quickfix()
  local ok, finder = pcall(require, 'lspsaga.finder')
  if not ok or not finder or not finder.list then
    vim.notify('[lspsaga] finder list is empty', vim.log.levels.WARN)
    return
  end

  local items = {}
  local node = finder.list

  while node do
    local value = node.value
    local range = value and (value.range or value.targetSelectionRange or value.selectionRange)

    if value and range and range.start then
      local uri = value.uri or value.targetUri
      local filename = uri and vim.uri_to_fname(uri) or nil

      if (not filename or filename == '') and value.bufnr then
        filename = vim.api.nvim_buf_get_name(value.bufnr)
      end

      if filename and filename ~= '' then
        items[#items + 1] = {
          filename = filename,
          lnum = range.start.line + 1,
          col = (range.start.character or 0) + 1,
          text = value.line or '',
          user_data = {
            filename = filename,
          },
        }
      end
    end

    node = node.next
  end

  if #items == 0 then
    vim.notify('[lspsaga] no locations to send into quickfix', vim.log.levels.WARN)
    return
  end

  vim.fn.setqflist({}, 'r', { title = 'Lspsaga Finder', items = items })

  if finder.clean then
    finder:clean()
  end

  vim.cmd('copen')
end

local function open_quickfix_item_under_cursor()
  local list = vim.fn.getqflist({ items = 1 })
  local idx = vim.fn.line('.')
  local item = list.items and list.items[idx] or nil

  if not item then
    vim.notify('[quickfix] no item under cursor', vim.log.levels.WARN)
    return
  end

  local filename = item.filename

  if (not filename or filename == '') and item.user_data and item.user_data.filename then
    filename = item.user_data.filename
  end

  if (not filename or filename == '') and item.bufnr and item.bufnr > 0 then
    local ok, name = pcall(vim.api.nvim_buf_get_name, item.bufnr)
    if ok and name ~= '' then
      filename = name
    end
  end

  if not filename or filename == '' then
    vim.notify('[quickfix] cannot resolve filename', vim.log.levels.ERROR)
    return
  end

  pcall(vim.cmd, 'wincmd p')
  vim.cmd('edit ' .. vim.fn.fnameescape(filename))

  local lnum = (item.lnum and item.lnum > 0) and item.lnum or 1
  local col = (item.col and item.col > 0) and (item.col - 1) or 0
  pcall(vim.api.nvim_win_set_cursor, 0, { lnum, col })
  vim.cmd('normal! zv')
end

require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    enable = true,
    sign = false,
    virtual_text = true
  },
  finder = {
    max_height = 0.6,
    keys = { vsplit = 'v' },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('SagaFinderQuickfix', { clear = true }),
  pattern = 'sagafinder',
  callback = function(args)
    vim.keymap.set('n', '<C-q>', saga_finder_to_quickfix, {
      buffer = args.buf,
      silent = true,
      desc = 'Lspsaga finder -> quickfix',
    })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('QuickfixOpenWithO', { clear = true }),
  pattern = 'qf',
  callback = function(args)
    vim.keymap.set('n', 'o', open_quickfix_item_under_cursor, {
      buffer = args.buf,
      silent = true,
      desc = 'Open quickfix item',
    })
  end,
})
