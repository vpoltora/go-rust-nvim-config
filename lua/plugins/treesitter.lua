require'nvim-treesitter.configs'.setup {
	-- Указываем только нужные парсеры вместо "all"
	-- чтобы избежать проблем с поврежденными парсерами типа ipkg
	ensure_installed = {
		-- Основные языки из вашего конфига
		"go",
		"rust",
		"lua",
		"python",
		"dart",
		"javascript",
		"typescript",
		"vue",
		"json",
		"jsonc",
		-- Полезные дополнительные
		"bash",
		"c",
		"cpp",
		"css",
		"html",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"yaml",
		"toml",
		"regex",
		"gitignore",
		"git_config",
		"gitcommit",
		"diff",
		"query", -- для treesitter запросов
	},
	-- Автоматически устанавливать парсеры при входе в буфер
	auto_install = true,
	highlight = { 
		enable = true,
		-- Дополнительные настройки для производительности
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = { 
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = { enable = true },
	indent = { enable = true },
}

