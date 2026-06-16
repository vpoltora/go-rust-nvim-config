local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- cmd+s: save file (macOS Ghostty custom hex / Linux Alt+s)
keymap("n", "<Char-0xAA>", "<cmd>write<cr>", default_opts)
keymap("n", "<A-s>", "<cmd>write<cr>", default_opts)

-- cmd+e: scroll downwards (macOS Ghostty custom hex / Linux Alt+e)
keymap("n", "<Char-0xAB>", "<C-e>", default_opts)
keymap("n", "<A-e>", "<C-e>", default_opts)

-- cmd+y: scroll upwards (macOS Ghostty custom hex / Linux Alt+y)
keymap("n", "<Char-0xAC>", "<C-y>", default_opts)
keymap("n", "<A-y>", "<C-y>", default_opts)

-- cmd+h: prev tab (macOS Ghostty custom hex / Linux Alt+h)
keymap("n", "<Char-0xAD>", "<cmd>BufferPrevious<cr>", default_opts)
keymap("n", "<A-h>", "<cmd>BufferPrevious<cr>", default_opts)

-- cmd+l: next tab (macOS Ghostty custom hex / Linux Alt+l)
keymap("n", "<Char-0xAE>", "<cmd>BufferNext<cr>", default_opts)
keymap("n", "<A-l>", "<cmd>BufferNext<cr>", default_opts)

-- cmd+w: close current tab (macOS Ghostty custom hex / Linux Alt+w)
keymap("n", "<Char-0xAF>", "<cmd>BufferClose<cr>", default_opts)
keymap("n", "<A-w>", "<cmd>BufferClose<cr>", default_opts)

-- cmd+t: find file toggle (macOS Ghostty custom hex / Linux Alt+t)
keymap("n", "<Char-0xA1>", "<cmd>NvimTreeFindFile<cr>", default_opts)
keymap("n", "<A-t>", "<cmd>NvimTreeFindFile<cr>", default_opts)

-- trouble plugin:
-- cmd+[: get troubles (macOS Ghostty custom hex / Linux Alt+[)
keymap("n", "<Char-0xA2>", "<cmd>Trouble diagnostics toggle<cr>", default_opts)
keymap("n", "<A-[>", "<cmd>Trouble diagnostics toggle<cr>", default_opts)
-- cmd+]: close troubles (macOS Ghostty custom hex / Linux Alt+])
keymap("n", "<Char-0xA3>", "<cmd>TroubleClose<cr>", default_opts)
keymap("n", "<A-]>", "<cmd>TroubleClose<cr>", default_opts)

-- cmd+n: open left bar (Ghostty sends 0xA4 for cmd+n / Linux Alt+n)
keymap('n', '<Char-0xA4>', '<cmd>NvimTreeToggle<cr>', default_opts)
keymap('n', '<A-n>', '<cmd>NvimTreeToggle<cr>', default_opts)

-- cmd+1: open left bar (macOS Ghostty custom hex / Linux Alt+1)
keymap('n', '<Char-0xA6>', '<cmd>NvimTreeToggle<cr>', default_opts)
keymap('n', '<A-1>', '<cmd>NvimTreeToggle<cr>', default_opts)

-- NEOTEST
keymap('n', '<Leader>mr', ':lua require("neotest").run.run()<CR>', default_opts)
keymap('n', '<Leader>ms', ':lua require("neotest").run.stop()<CR>', default_opts)
keymap('n', '<Leader>mo', ':lua require("neotest").output.open()<CR>', default_opts)
keymap('n', '<Leader>mO', ':lua require("neotest").output.open({ enter = true })<CR>', default_opts)
keymap('n', '<Leader>mi', ':lua require("neotest").summary.toggle()<CR>', default_opts)
keymap('n', '<Leader>mf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', default_opts)
-- run all
keymap('n', '<Leader>mra', ':lua require("neotest").run.run(vim.fn.getcwd())<CR>', default_opts)

-- LSP Go-specific mappings (using native LSP and Lspsaga instead of vim-go)
keymap('n', '<Leader>gi', ':lua vim.lsp.buf.implementation()<CR>', default_opts)
keymap('n', '<Leader>gc', ':lua vim.lsp.buf.incoming_calls()<CR>', default_opts)
keymap('n', '<Leader>gr', ':lua vim.lsp.buf.references()<CR>', default_opts)
keymap('n', 'gh', '<cmd>Lspsaga finder<CR>', default_opts)
keymap('n', '<Leader>,m', '<cmd>Lspsaga code_action<CR>', default_opts)

-- lsp buf format
keymap('n', '<Leader>bf', ':lua vim.lsp.buf.format()<cr>', default_opts)

-- DAP keybindings are defined in lua/plugins/dap.lua:
-- F5: Continue/Start debugging
-- F10: Step over
-- F11: Step into  
-- F12: Step out
-- <Leader>db: Toggle breakpoint
-- <Leader>dB: Conditional breakpoint
-- <Leader>dl: Log point
-- <Leader>dt: Debug test under cursor (Go)
-- <Leader>dT: Debug last test
-- <Leader>du: Toggle debug UI
-- <Leader>dr: Open debug REPL
-- <Leader>dR: Run last debug config
-- <Leader>dx: Terminate debugging
-- <Leader>de: Evaluate expression

