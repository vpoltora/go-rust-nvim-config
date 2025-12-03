local dap = require('dap')
local dapui = require('dapui')

-- Setup dap-go with delve
require('dap-go').setup({
  delve = {
    path = '/Users/itxor/.gvm/pkgsets/go1.24.4/global/bin/dlv',
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
    -- Build flags for tests (e.g., integration tags)
    build_flags = "-tags=integration",
  },
  tests = {
    verbose = true,
  },
  -- Custom configurations
  dap_configurations = {
    {
      type = "go",
      name = "Debug Test (Package)",
      request = "launch",
      mode = "test",
      program = "${fileDirname}",
      buildFlags = "-tags=integration",
    },
  },
})

-- Setup dap-ui
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

-- Setup virtual text
require('nvim-dap-virtual-text').setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  virt_text_pos = 'eol',
})

-- Auto open/close dapui (use after to ensure session is ready)
dap.listeners.after.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
  dapui.open()
end
-- Don't auto-close UI on termination (close manually with \du)
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- Breakpoint signs
vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◐', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })

-- Highlight groups
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#e5a800' })
vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#888888' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379' })
vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d' })

-- Keymaps (JetBrains-style)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic debugging (JetBrains style)
keymap('n', '<F9>', function() dap.toggle_breakpoint() end, opts)                    -- Toggle breakpoint
keymap('n', '<S-F9>', function() require('dap-go').debug_test() end, opts)           -- Debug test
keymap('n', '<F8>', function() dap.step_over() end, opts)                            -- Step over
keymap('n', '<F7>', function() dap.step_into() end, opts)                            -- Step into
keymap('n', '<S-F8>', function() dap.step_out() end, opts)                           -- Step out
keymap('n', '<F5>', function() dap.continue() end, opts)                             -- Resume/Continue
keymap('n', '<S-F5>', function() dap.terminate() end, opts)                          -- Stop

-- Additional breakpoint controls
keymap('n', '<C-S-F8>', function() dap.set_breakpoint(vim.fn.input('Condition: ')) end, opts)  -- Conditional breakpoint
keymap('n', '<Leader>db', function() dap.toggle_breakpoint() end, opts)              -- Alternative toggle
keymap('n', '<Leader>dB', function() dap.set_breakpoint(vim.fn.input('Condition: ')) end, opts)

-- Debug test (Go specific)
keymap('n', '<Leader>dt', function() require('dap-go').debug_test() end, opts)
keymap('n', '<Leader>dT', function() require('dap-go').debug_last_test() end, opts)

-- Debug specific test by name (for testify Suite)
keymap('n', '<Leader>ds', function()
  local testname = vim.fn.input('Test name (regex): ')
  if testname ~= '' then
    local dir = vim.fn.expand('%:p:h')
    -- Find suite runner function in the package
    local suite_runner = nil
    local files = vim.fn.glob(dir .. '/*_test.go', false, true)
    for _, file in ipairs(files) do
      local content = vim.fn.readfile(file)
      for _, line in ipairs(content) do
        local match = line:match('func (Test%w+)%(%s*t%s*%*testing%.T')
        if match then
          suite_runner = match
          break
        end
      end
      if suite_runner then break end
    end
    
    -- Build the full test pattern
    local pattern = testname
    if suite_runner and not testname:match('^' .. suite_runner) then
      pattern = suite_runner .. '/' .. testname
    end
    
    print('Running: ' .. pattern)
    dap.run({
      type = "go",
      name = "Debug: " .. testname,
      request = "launch",
      mode = "test",
      program = dir,
      args = { "-test.run", pattern },
      buildFlags = "-tags=integration",
    })
  end
end, opts)

-- UI controls
keymap('n', '<Leader>du', function() dapui.toggle() end, opts)
keymap('n', '<Leader>dr', function() dap.repl.open() end, opts)
keymap('n', '<Leader>dR', function() dap.run_last() end, opts)

-- Evaluate expression (Alt+F8 in JetBrains)
keymap('n', '<A-F8>', function() dapui.eval() end, opts)
keymap('v', '<A-F8>', function() dapui.eval() end, opts)
keymap('n', '<Leader>de', function() dapui.eval() end, opts)
keymap('v', '<Leader>de', function() dapui.eval() end, opts)
