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
					"lua_ls",
					"html",
					"ts_ls",
					"cssls",
					"jsonls",
					"prismals",
				},
				automatic_enable = false,
			})

			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"eslint_d",
					"htmlhint",
					"stylelint",
					"jsonlint",
					"yamllint",
					"flake8",
				},
			})
		end,
	},
}
