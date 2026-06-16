-- fzf-lua Configuration
local ok, fzf = pcall(require, "fzf-lua")
if not ok then return end

fzf.setup({})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map <leader>f to fzf-lua's file search
keymap("n", "<leader>f", fzf.files, { desc = "Fzf files", silent = true })

-- Map <leader>g to fzf-lua's live grep
keymap("n", "<leader>g", fzf.live_grep, { desc = "Fzf live grep", silent = true })
