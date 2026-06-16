local ok, harpoon = pcall(require, "harpoon")
if not ok then return end
harpoon:setup()

local keymap = vim.keymap.set

-- Add file to harpoon
keymap("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file to list" })

-- Toggle quick menu
keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })

-- Navigate quickly to files 1-4
keymap("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Navigate to file 1" })
keymap("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon: Navigate to file 2" })
keymap("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon: Navigate to file 3" })
keymap("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon: Navigate to file 4" })

-- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Prev file" })
keymap("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
