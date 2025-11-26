require('lspsaga').setup({
  lightbulb = {
    enable = true,
    sign = false,
    virtual_text = true
  },
  finder = {
    max_height = 0.6,
    keys = { vsplit = 'v' },
  },
  symbol_in_winbar = {
    enable = true,
    separator = ' › ',
    show_file = true,
    folder_level = 2,
    hide_keyword = false,
  },
  ui = {
    border = 'rounded',
    winblend = 0,
    colors = {
      normal_bg = '#FCFCFC',
    },
  },
})

-- Custom highlight groups for breadcrumbs matching Cursor Light theme
vim.api.nvim_set_hl(0, 'WinBar', { bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarSep', { fg = '#999999', bg = '#FCFCFC' })

-- Hide folder icons (make them invisible)
vim.api.nvim_set_hl(0, 'SagaWinbarFolderIcon', { fg = '#FCFCFC', bg = '#FCFCFC' })

-- Folders in gray (like Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarFolder', { fg = '#999999', bg = '#FCFCFC' })

-- Files in blue/cyan (like Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarFile', { fg = '#3C7CAB', bg = '#FCFCFC' })
-- Hide file icons (make them invisible)
vim.api.nvim_set_hl(0, 'SagaWinbarFileIcon', { fg = '#FCFCFC', bg = '#FCFCFC' })

-- Force highlights on ColorScheme change to prevent overrides
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, 'SagaWinbarFolderIcon', { fg = '#FCFCFC', bg = '#FCFCFC' })
    vim.api.nvim_set_hl(0, 'SagaWinbarFileIcon', { fg = '#FCFCFC', bg = '#FCFCFC' })
    vim.api.nvim_set_hl(0, 'SagaWinbarSep', { fg = '#999999', bg = '#FCFCFC' })
  end,
})

-- Functions and methods in orange (like M.setup in Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarFunction', { fg = '#DB704B', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarMethod', { fg = '#DB704B', bg = '#FCFCFC' })

-- Types and structures in blue
vim.api.nvim_set_hl(0, 'SagaWinbarModule', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarClass', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarStruct', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarInterface', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarNamespace', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarPackage', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarEnum', { fg = '#206595', bg = '#FCFCFC' })

-- Variables and properties (dark text like 'fg' in Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarVariable', { fg = '#141414', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarProperty', { fg = '#6049B3', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarKey', { fg = '#141414', bg = '#FCFCFC' })

-- Constants and other types
vim.api.nvim_set_hl(0, 'SagaWinbarConstant', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarArray', { fg = '#141414', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarBoolean', { fg = '#4C7F8C', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarNumber', { fg = '#206595', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarObject', { fg = '#141414', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarString', { fg = '#9E94D5', bg = '#FCFCFC' })
vim.api.nvim_set_hl(0, 'SagaWinbarTypeParameter', { fg = '#206595', bg = '#FCFCFC' })
