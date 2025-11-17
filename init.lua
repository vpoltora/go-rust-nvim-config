local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('~/plugins/present.nvim')

-- language support
Plug('nvim-treesitter/nvim-treesitter', {[ 'do' ] = ':TSUpdate'})
Plug('tpope/vim-surround')
--go
Plug('fatih/vim-go', { [ 'do' ] = ':GoUpdateBinaries' })
--dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

-- for debugging
-- Plug('mfussenegger/nvim-dap') 
-- Plug('rcarriga/nvim-dap-ui') 
-- Plug('leoluz/nvim-dap-go') 

-- асинхронная проверка файлов во время набора текста
Plug('neovim/nvim-lspconfig')

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
Plug('rebelot/kanagawa.nvim')
Plug('uloco/bluloco.nvim')
Plug('rktjmp/lush.nvim')
Plug('folke/tokyonight.nvim')
Plug('rafi/awesome-vim-colorschemes')
Plug('catppuccin/nvim')
Plug('scottmckendry/cyberdream.nvim')
Plug('EdenEast/nightfox.nvim')

-- Вкладки файлов
Plug('romgrk/barbar.nvim')
-- for file icons
Plug('kyazdani42/nvim-web-devicons')

-- Дерево файлов
Plug('kyazdani42/nvim-tree.lua')

-- Telescope
Plug('nvim-lua/plenary.nvim') --for fzf
Plug('nvim-telescope/telescope.nvim', { [ 'tag' ] = '0.1.4' })
Plug('ibhagwan/fzf-lua', {['branch'] = 'main'})

-- Автоматическое закрытие скобок
Plug('jiangmiao/auto-pairs')

-- Строка статуса
Plug('nvim-lualine/lualine.nvim')

-- история гита
Plug('f-person/git-blame.nvim')

-- подсветка ошибок
Plug('folke/trouble.nvim')

Plug('mg979/vim-visual-multi', {[ 'branch' ] = 'master'})

-- плагины для работы с тестами
Plug('fredrikaverpil/neotest-golang')
Plug('antoinemadec/FixCursorHold.nvim')
Plug('nvim-neotest/nvim-nio')
Plug('nvim-neotest/neotest')

Plug('rmagatti/auto-session')

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

Plug ('olimorris/codecompanion.nvim')
Plug ('j-hui/fidget.nvim')
Plug ('ravitemer/mcphub.nvim')
Plug ('OXY2DEV/markview.nvim')

Plug ( 'nvzone/volt' )
Plug ( 'gisketch/triforce.nvim' )

vim.call('plug#end')

local home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- common settings 
require"common" -- +
-- themes
require"theme" -- +
-- custom keymaps
require"combinations" -- +

-- plugins configs
require('plugins.codecompanion.codecompanion')
require('plugins.lualine.lualine')
require('plugins.comments')
require('plugins.auto-sessions')
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
require('plugins.markview')
require('plugins.triforce')

-- source $HOME/.config/nvim/tabs.vim
-- source $HOME/.config/nvim/debugger.vim
-- require"avanteplug"
-- require"dev"

