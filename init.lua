local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('vpoltora/cursor-light.nvim')

Plug('tpope/vim-surround')

-- language support
Plug('nvim-treesitter/nvim-treesitter', {[ 'do' ] = ':TSUpdate'})
--go
Plug('fatih/vim-go', { [ 'do' ] = ':GoUpdateBinaries' })

-- Синхронный автокомплит
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp' )
Plug('hrsh7th/cmp-nvim-lsp-signature-help')

-- comment plugin
Plug('numToStr/Comment.nvim')

-- themes
Plug('morhetz/gruvbox')

-- tabs with icons
Plug('romgrk/barbar.nvim')
-- for file icons
Plug('kyazdani42/nvim-web-devicons')

-- files tree
Plug('kyazdani42/nvim-tree.lua')

-- telescope
Plug('nvim-lua/plenary.nvim') --for fzf
Plug('nvim-telescope/telescope.nvim', { [ 'tag' ] = '0.1.4' })
Plug('ibhagwan/fzf-lua', {['branch'] = 'main'})

-- auto pairs plugin
Plug('windwp/nvim-autopairs')

-- status line
Plug('nvim-lualine/lualine.nvim')

-- git history
Plug('f-person/git-blame.nvim')

-- plugin for highlighting errors and warnings
Plug('folke/trouble.nvim')

-- for tests
Plug('fredrikaverpil/neotest-golang')
Plug('antoinemadec/FixCursorHold.nvim')
Plug('nvim-neotest/nvim-nio')
Plug('nvim-neotest/neotest')

Plug('rmagatti/auto-session')

Plug('mg979/vim-visual-multi', {[ 'branch' ] = 'master'})

Plug('nvimdev/lspsaga.nvim')

Plug('williamboman/mason.nvim')

Plug ('eddyekofo94/gruvbox-flat.nvim')

Plug ('stevearc/dressing.nvim')
Plug ('nvim-lua/plenary.nvim')
Plug ('MunifTanjim/nui.nvim')
Plug ('MeanderingProgrammer/render-markdown.nvim')

Plug ( 'echasnovski/mini.icons' )
Plug ( 'HakonHarnes/img-clip.nvim' )

Plug('nvimtools/none-ls.nvim')

-- DAP (Debug Adapter Protocol) for debugging
Plug('mfussenegger/nvim-dap')
Plug('leoluz/nvim-dap-go')
Plug('rcarriga/nvim-dap-ui')
Plug('theHamsta/nvim-dap-virtual-text')

-- Git merge conflict resolution (3-way merge like JetBrains)
Plug('sindrets/diffview.nvim')
Plug('akinsho/git-conflict.nvim')

Plug('esmuellert/vscode-diff.nvim', {['on'] = 'CodeDiff'})
Plug('MunifTanjim/nui.nvim')

Plug ('olimorris/codecompanion.nvim')
Plug ('j-hui/fidget.nvim')
Plug ('ravitemer/mcphub.nvim')

Plug ( 'nvzone/volt' )
Plug ( 'gisketch/triforce.nvim' )

vim.call('plug#end')

local home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- common settings 
require"common"
-- themes
require"theme"
-- custom keymaps
require"combinations"

-- plugins configs
require('plugins.codecompanion.codecompanion')
require('plugins.lualine.lualine')
require('plugins.comments')
require('plugins.auto-sessions')
require('plugins.autopairs')
require('plugins.mason')
require('plugins.telescope.telescope')
require('plugins.gitblame')
require('plugins.treesitter')
require('plugins.vimtree')
require('plugins.trouble')
require('plugins.barbar')
require('plugins.copilot')
require('plugins.lspsaga')
require('plugins.neotest')
require('plugins.render-markdown')
require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.triforce')
require('plugins.dap')
require('plugins.diffview')
require('plugins.git-conflict')

-- Custom UI settings
-- Uncomment the line below to enable custom line column with separator
-- require('plugins.custom-linecolumn').setup()


