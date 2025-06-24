return {
	"nvim-treesitter/nvim-treesitter",
	branc = "master",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"html",
				"css",
				"json",
				"scss",
				"toml",
				"yaml",
				"typescript",
				"javascript",
				"prisma",
				"bash",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.treesitter.language.register("bash", "zsh")
	end,
}
