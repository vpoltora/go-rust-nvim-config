local ok, git_conflict = pcall(require, "git-conflict")
if not ok then
  return
end

git_conflict.setup({
  default_mappings = false,     -- We'll set our own
  default_commands = true,
  disable_diagnostics = true,   -- Disable diagnostics in conflict buffers
  list_opener = 'copen',        -- Quickfix for conflict list
  highlights = {
    incoming = 'DiffText',      -- Incoming (theirs) - blue/purple
    current = 'DiffAdd',        -- Current (ours/HEAD) - green
    ancestor = 'DiffDelete',    -- Base - red
  },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Navigation between conflicts
keymap('n', ']x', '<Plug>(git-conflict-next-conflict)', { silent = true })
keymap('n', '[x', '<Plug>(git-conflict-prev-conflict)', { silent = true })

-- Resolve conflicts (remember: during rebase, ours=master, theirs=your changes)
keymap('n', '<Leader>co', '<Plug>(git-conflict-ours)', { silent = true })      -- Accept current (ours)
keymap('n', '<Leader>ct', '<Plug>(git-conflict-theirs)', { silent = true })    -- Accept incoming (theirs)
keymap('n', '<Leader>cb', '<Plug>(git-conflict-both)', { silent = true })      -- Accept both
keymap('n', '<Leader>cn', '<Plug>(git-conflict-none)', { silent = true })      -- Accept none

-- Custom: delete entire conflict block (more reliable)
keymap('n', '<Leader>cd', function()
  local start_line = vim.fn.search('^<<<<<<<', 'bcnW')
  local end_line = vim.fn.search('^>>>>>>>', 'cnW')
  if start_line > 0 and end_line > 0 and end_line >= start_line then
    vim.cmd(start_line .. ',' .. end_line .. 'd')
    print('Deleted conflict block: lines ' .. start_line .. '-' .. end_line)
  else
    print('No conflict block found')
  end
end, { silent = true, desc = "Delete entire conflict block" })

-- List all conflicts in quickfix
keymap('n', '<Leader>cq', '<cmd>GitConflictListQf<cr>', opts)

-- Refresh conflict highlights
keymap('n', '<Leader>cr', '<cmd>GitConflictRefresh<cr>', opts)
