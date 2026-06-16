local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')


Plug('tpope/vim-surround')

-- language support
Plug('nvim-treesitter/nvim-treesitter', {[ 'do' ] = ':TSUpdate'})

-- Синхронный автокомплит
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp' )
Plug('hrsh7th/cmp-nvim-lsp-signature-help')

-- comment plugin
Plug('numToStr/Comment.nvim')

-- themes
Plug('ellisonleao/gruvbox.nvim')

-- tabs with icons
Plug('romgrk/barbar.nvim')
-- for file icons
Plug('nvim-tree/nvim-web-devicons')

-- files tree
Plug('nvim-tree/nvim-tree.lua')

-- fuzzy finder
Plug('nvim-lua/plenary.nvim') --for fzf and other plugins
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
Plug ('MeanderingProgrammer/render-markdown.nvim')

-- DAP (Debug Adapter Protocol) for debugging
Plug('mfussenegger/nvim-dap')
Plug('leoluz/nvim-dap-go')
Plug('rcarriga/nvim-dap-ui')
Plug('theHamsta/nvim-dap-virtual-text')

-- Git merge conflict resolution (3-way merge like JetBrains)
Plug('sindrets/diffview.nvim')
Plug('akinsho/git-conflict.nvim')

Plug ( 'ThePrimeagen/harpoon', { ['branch'] = 'harpoon2' } )

vim.call('plug#end')

local home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- common settings 
require"common"
-- themes
require"theme"
-- custom keymaps
require"combinations"

local function safe_require(module)
  local ok, err = pcall(require, module)
  if not ok then
    if not string.find(err, "not found") then
      vim.schedule(function()
        vim.notify("Error loading " .. module .. ":\n" .. err, vim.log.levels.ERROR)
      end)
    end
  end
  return ok
end

-- plugins configs
safe_require('plugins.lualine.lualine')
safe_require('plugins.comments')
safe_require('plugins.auto-sessions')
safe_require('plugins.autopairs')
safe_require('plugins.mason')
safe_require('plugins.fzf')
safe_require('plugins.gitblame')
safe_require('plugins.treesitter')
safe_require('plugins.vimtree')
safe_require('plugins.trouble')
safe_require('plugins.barbar')
safe_require('plugins.lspsaga')
safe_require('plugins.neotest')
safe_require('plugins.render-markdown')
safe_require('plugins.cmp')
safe_require('plugins.lspconfig')
safe_require('plugins.dap')
safe_require('plugins.diffview')
safe_require('plugins.url-handler')
safe_require('plugins.git-conflict')
safe_require('plugins.harpoon')

-- Custom UI settings
-- Enable custom line column with separator
local ok_cl, cl = pcall(require, 'plugins.custom-linecolumn')
if ok_cl then
  cl.setup()
end


