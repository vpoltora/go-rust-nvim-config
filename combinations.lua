local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- cmd+s: save file
keymap("n", "<Char-0xAA>", "<cmd>write<cr>", default_opts)
-- cmd+e: scroll downwords
keymap("n", "<Char-0xAB>", "<C-e>", default_opts)
-- cmd+e: scroll upwords
keymap("n", "<Char-0xAC>", "<C-y>", default_opts)
-- cmd+h: next tab
keymap("n", "<Char-0xAD>", "<cmd>BufferPrevious<cr>", default_opts)
-- cmd+l: last tab
keymap("n", "<Char-0xAE>", "<cmd>BufferNext<cr>", default_opts)
-- cmd+w: close current tab
keymap("n", "<Char-0xAF>", "<cmd>BufferClose<cr>", default_opts)
-- cmd+t: find file toogle 
keymap("n", "<Char-0xA1>", "<cmd>NvimTreeFindFile<cr>", default_opts)

-- trouble plugin:
-- cmd+[: get troubles
keymap("n", "<Char-0xA2>", "<cmd>Trouble diagnostics toggle<cr>", default_opts)
-- cmd+]: close troubles
keymap("n", "<Char-0xA3>", "<cmd>TroubleClose<cr>", default_opts)

--copilot
-- cmd+n: next  
keymap('i', '<Char-0xA4>', '<Plug>(copilot-next)', default_opts)
-- cmd+m: last  
keymap('i', '<Char-0xA5>', '<Plug>(copilot-previous)', default_opts)

-- cmd+1: open left bar  
keymap('n', '<Char-0xA4>', '<cmd>NvimTreeToggle<cr>', default_opts)


vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern = "*.go",
        callback = function()
			-- option-command-b
			--au FileType go nmap 
			---- fn+f2 
			--au FileType go nmap <D-F2> <Plug>(go-rename)
			---- показывает все ссылки на объект
			--au FileType go nmap <leader>ref <Plug>(go-referrers)
			---- generate if err != nil ... 
			--au FileType go nmap <leader>ie <Plug>(go-iferr)
			---- go debug start 
			--au FileType go nmap <leader>bbg <Plug>(go-debug-start)
			---- go fmt start 
			--au FileType go nmap <D>fmt <Plug>(go-fmt)
			---- go lint start 
			--au FileType go nmap <leader>lint <Plug>(go-lint)
			---- go vet start 
			--au FileType go nmap <leader>vet <Plug>(go-lint)
			--au FileType go nmap <leader>dep <Plug>(go-deps)
			--au FileType go nmap <leader>gds <Plug>(go-def-stack)

			---- not working:
			---- показывает все вызовы объекта
			--au FileType go nmap <leader>call <Plug>(go-callers)
			---- go test current func under cursor
			--au FileType go nmap <leader>tf <Plug>(go-test-func)
			---- show depends source files 
			--au FileType go nmap <leader>ssf <Plug>(go-files)
        end
    }
)

-- NEOTEST
keymap('n', '<Leader>mr', ':lua require("neotest").run.run()<CR>', default_opts)
keymap('n', '<Leader>ms', ':lua require("neotest").run.stop()<CR>', default_opts)
keymap('n', '<Leader>mo', ':lua require("neotest").output.open()<CR>', default_opts)
keymap('n', '<Leader>mO', ':lua require("neotest").output.open({ enter = true })<CR>', default_opts)
keymap('n', '<Leader>mi', ':lua require("neotest").summary.toggle()<CR>', default_opts)
keymap('n', '<Leader>mf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', default_opts)
-- run all
keymap('n', '<Leader>mra', ':lua require("neotest").run.run(vim.fn.getcwd())<CR>', default_opts)

keymap('n', '<Leader>gi', ':GoImplements<CR>', default_opts)
keymap('n', '<Leader>gc', ':GoCallers<CR>', default_opts)
keymap('n', '<Leader>gr', ':GoReferrers<CR>', default_opts)
keymap('n', 'gh', '<cmd>Lspsaga finder<CR>', default_opts)
-- auto fill go structs
keymap('n', '<Leader>,m', '<cmd>GoFillStruct<cr>', default_opts)

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

