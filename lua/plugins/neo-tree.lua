return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Exibe os arquivos ocultos (de acordo com padrões)
					hide_dotfiles = false, -- Controla a exibição de arquivos iniciados com ponto (.)
					hide_gitignored = false, -- Esconde arquivos ignorados pelo Git
					-- Adicionando agrupamento de arquivos
					patterns = {
						-- Para o package.json e arquivos relacionados
						["package.json"] = {
							"package.json",
							".eslint*",
							"prettier*",
							"tsconfig*",
							"vite*",
							"pnpm-lock*",
							"package-lock*",
							"bun.lock*",
						},
						-- Para o tailwind.config.js e arquivos relacionados
						["tailwind.config.js"] = {
							"tailwind.config*",
							"postcss.config*",
						},
						-- Para arquivos .env e .env.local
						[".env"] = {
							".env*",
						},
					},
				},
			},
		})
	end,
}
