return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					"html",
					"jsonls",
					"lua_ls",
					"prismals",
					"ts_ls",
				},
				automatic_enable = false,
			})

			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"eslint_d",
					"flake8",
					"htmlhint",
					"htmlbeautifier",
					"jsonlint",
					"luacheck",
					"stylelint",
					"yamllint",
					"black",
					"isort",
					"prettier",
					"stylua",
				},
			})
		end,
	},
}
