return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")
		-- Setting up linter by file type(ft)
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			html = { "htmlhint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
			python = { "flake8" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Auto command to execute linting when the events below are triggered
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", lint.try_lint, { desc = "trigger linting for current file" })
	end,
}
