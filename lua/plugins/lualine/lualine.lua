local spinner = require("plugins.lualine.codecompanion-spinner")
spinner:init()

require('lualine').setup {
    options = {
        theme = 'gruvbox' 
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        },
        lualine_x = {
			function() return spinner:update_status() end,
			'fileformat', 
			'filetype'
		},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}


