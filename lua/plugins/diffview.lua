local ok, diffview = pcall(require, "diffview")
if not ok then
  return
end

local actions = require("diffview.actions")

diffview.setup({
  diff_binaries = false,
  enhanced_diff_hl = true,
  use_icons = true,
  show_help_hints = true,
  watch_index = true,

  view = {
    -- Default diff view
    default = {
      layout = "diff2_horizontal",
      disable_diagnostics = false,
      winbar_info = false,
    },
    -- Merge conflict resolution (3-way diff like JetBrains)
    merge_tool = {
      layout = "diff3_mixed",  -- OURS | BASE | THEIRS on top, MERGED on bottom
      disable_diagnostics = true,
      winbar_info = true,
    },
    file_history = {
      layout = "diff2_horizontal",
      disable_diagnostics = false,
      winbar_info = false,
    },
  },

  file_panel = {
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
    win_config = {
      position = "left",
      width = 35,
    },
  },

  -- Keymaps similar to JetBrains
  keymaps = {
    disable_defaults = false,
    view = {
      -- Navigation between conflicts
      { "n", "]x",          actions.next_conflict,                  { desc = "Next conflict" } },
      { "n", "[x",          actions.prev_conflict,                  { desc = "Previous conflict" } },
      
      -- Accept changes (JetBrains-style)
      { "n", "<Leader>co",  actions.conflict_choose("ours"),        { desc = "Accept OURS (left)" } },
      { "n", "<Leader>ct",  actions.conflict_choose("theirs"),      { desc = "Accept THEIRS (right)" } },
      { "n", "<Leader>cb",  actions.conflict_choose("base"),        { desc = "Accept BASE" } },
      { "n", "<Leader>ca",  actions.conflict_choose("all"),         { desc = "Accept ALL versions" } },
      { "n", "<Leader>cn",  actions.conflict_choose("none"),        { desc = "Accept NONE (delete conflict)" } },
      
      -- Accept all in file
      { "n", "<Leader>cO",  actions.conflict_choose_all("ours"),    { desc = "Accept all OURS in file" } },
      { "n", "<Leader>cT",  actions.conflict_choose_all("theirs"),  { desc = "Accept all THEIRS in file" } },
      
      -- File navigation
      { "n", "<Tab>",       actions.select_next_entry,              { desc = "Next file" } },
      { "n", "<S-Tab>",     actions.select_prev_entry,              { desc = "Previous file" } },
      { "n", "<Leader>e",   actions.focus_files,                    { desc = "Focus file panel" } },
      { "n", "<Leader>b",   actions.toggle_files,                   { desc = "Toggle file panel" } },
    },
    diff3 = {
      -- Get changes from specific buffer in 3-way diff
      { { "n", "x" }, "2do",  actions.diffget("ours"),              { desc = "Get from OURS" } },
      { { "n", "x" }, "3do",  actions.diffget("theirs"),            { desc = "Get from THEIRS" } },
      { "n",          "g?",   actions.help({ "view", "diff3" }),    { desc = "Help" } },
    },
    file_panel = {
      { "n", "j",           actions.next_entry,                     { desc = "Next entry" } },
      { "n", "k",           actions.prev_entry,                     { desc = "Previous entry" } },
      { "n", "<CR>",        actions.select_entry,                   { desc = "Open diff" } },
      { "n", "o",           actions.select_entry,                   { desc = "Open diff" } },
      { "n", "s",           actions.toggle_stage_entry,             { desc = "Stage/unstage" } },
      { "n", "S",           actions.stage_all,                      { desc = "Stage all" } },
      { "n", "U",           actions.unstage_all,                    { desc = "Unstage all" } },
      { "n", "X",           actions.restore_entry,                  { desc = "Restore file" } },
      { "n", "R",           actions.refresh_files,                  { desc = "Refresh" } },
      { "n", "[x",          actions.prev_conflict,                  { desc = "Previous conflict" } },
      { "n", "]x",          actions.next_conflict,                  { desc = "Next conflict" } },
      { "n", "g?",          actions.help("file_panel"),             { desc = "Help" } },
    },
  },
})

-- Keymaps for opening diffview
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Open diff view
keymap('n', '<Leader>gd', '<cmd>DiffviewOpen<cr>', opts)
-- Open diff for current file history  
keymap('n', '<Leader>gh', '<cmd>DiffviewFileHistory %<cr>', opts)
-- Open diff for branch history
keymap('n', '<Leader>gH', '<cmd>DiffviewFileHistory<cr>', opts)
-- Close diff view
keymap('n', '<Leader>gc', '<cmd>DiffviewClose<cr>', opts)
-- Open merge tool (during merge/rebase conflicts)
keymap('n', '<Leader>gm', '<cmd>DiffviewOpen<cr>', opts)
