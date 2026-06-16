vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('render-markdown').setup({})
  end,
})
