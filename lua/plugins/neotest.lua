require("neotest").setup({
  adapters = {
    require("neotest-golang")({
      recursive_run = true
    })
  },
  keys = {
	  {
		"<leader>td",
		function()
		  require("neotest").run.run({ suite = false, strategy = "dap" })
		end,
		desc = "Debug nearest test",
	  },
  },
})
