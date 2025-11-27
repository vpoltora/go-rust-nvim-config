local cursor_light = require('cursor-light')

require('lspsaga').setup(
  vim.tbl_deep_extend('force',
    cursor_light.lspsaga_config(),
    {
      lightbulb = {
        enable = true,
        sign = false,
        virtual_text = true
      },
      finder = {
        max_height = 0.6,
        keys = { vsplit = 'v' },
      },
    }
  )
)
