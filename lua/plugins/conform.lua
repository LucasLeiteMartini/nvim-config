return {
	"stevearc/conform.nvim",
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				scss = { "prettier" },
				prisma = { "prettier" },
				yaml = { "prettier" },
				python = { "isort", "black" },
			},

			formatters = {
				prettier = {
					prepend_args = {
						"--single-quote",
						"--semi",
						"--print-width",
						"80",
						"--tab-width",
						"2",
					},
				},
			},

			format_on_save = {
				timeout_ms = 100,
				lsp_fallback = true,
				async = false,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>i", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 100,
			})
		end)
	end,
}
