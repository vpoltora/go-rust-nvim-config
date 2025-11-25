-- Neovim 0.11 LSP Configuration
-- Documentation: https://neovim.io/doc/user/lsp.html

-- ========== DIAGNOSTICS CONFIGURATION ==========
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = 'if_many',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- Define diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.api.nvim_set_hl(0, hl, {})
end

-- ========== DIAGNOSTIC KEYMAPS ==========
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- ========== LSP ATTACH AUTOCOMMAND ==========
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = false })
    end, bufopts)
    
    if client then
      print(string.format('✓ LSP attached: %s (buffer %d)', client.name, bufnr))
    end
  end,
})

-- ========== GOPLS CONFIGURATION ==========
vim.lsp.config('gopls', {
  cmd = { '/Users/poltora.dev/go/bin/gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        nilness = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = false,
      semanticTokens = true,
    },
  },
})

-- Enable gopls on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.lsp.enable('gopls')
  end,
  once = true,
})

-- Enable gopls on FileType as backup
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
  callback = function(args)
    vim.defer_fn(function()
      if #vim.lsp.get_clients({ bufnr = args.buf, name = 'gopls' }) == 0 then
        vim.lsp.enable('gopls')
      end
    end, 100)
  end,
})

-- ========== RUST ANALYZER CONFIGURATION ==========
vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

-- Enable rust-analyzer on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.lsp.enable('rust_analyzer')
  end,
  once = true,
})

-- Enable rust-analyzer on FileType as backup
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function(args)
    vim.defer_fn(function()
      if #vim.lsp.get_clients({ bufnr = args.buf, name = 'rust_analyzer' }) == 0 then
        vim.lsp.enable('rust_analyzer')
      end
    end, 100)
  end,
})

-- ========== LUA LANGUAGE SERVER CONFIGURATION ==========
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
})

-- Enable lua_ls on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.lsp.enable('lua_ls')
  end,
  once = true,
})

-- Enable lua_ls on FileType as backup
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function(args)
    vim.defer_fn(function()
      if #vim.lsp.get_clients({ bufnr = args.buf, name = 'lua_ls' }) == 0 then
        vim.lsp.enable('lua_ls')
      end
    end, 100)
  end,
})

-- ========== PYTHON LSP SERVER CONFIGURATION ==========
vim.lsp.config('pylsp', {
  cmd = { '/Users/poltora.dev/.local/share/nvim/mason/bin/pylsp' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100,
        },
        autopep8 = {
          enabled = true,
        },
        flake8 = {
          enabled = false,
        },
        pylint = {
          enabled = false,
        },
        pyflakes = {
          enabled = true,
        },
        mccabe = {
          enabled = true,
          threshold = 15,
        },
        rope_completion = {
          enabled = true,
        },
        jedi_completion = {
          enabled = true,
          include_params = true,
        },
        jedi_hover = {
          enabled = true,
        },
        jedi_references = {
          enabled = true,
        },
        jedi_signature_help = {
          enabled = true,
        },
        jedi_symbols = {
          enabled = true,
          all_scopes = true,
        },
      },
    },
  },
})

-- Enable pylsp on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.lsp.enable('pylsp')
  end,
  once = true,
})

-- Enable pylsp on FileType as backup
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function(args)
    vim.defer_fn(function()
      if #vim.lsp.get_clients({ bufnr = args.buf, name = 'pylsp' }) == 0 then
        vim.lsp.enable('pylsp')
      end
    end, 100)
  end,
})
