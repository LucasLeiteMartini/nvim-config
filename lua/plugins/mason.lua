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
          --Docker
          "dockerls",
          "docker_compose_language_service",

          -- Web snippets
          "emmet_language_server",

          -- Fish shell lsp
          "fish_lsp",

          -- GoLang
          "gopls",

          -- Web related
          "html",
          "ts_ls",
          "cssls",
          "angularls",

          -- JSON
          "jsonls",

          -- YAML
          "yamlls",

          -- TOML
          "tombi",

          -- Lua
          "lua_ls",

          -- Markdown
          "marksman",

          -- Prisma
          "prismals",

          -- Python
          "pyright",
        },
        automatic_enable = false,
      })

      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          -- Python
          "black",
          "isort",
          "mypy",
          "pylint",

          -- Go
          "gofumpt",
          "goimports-reviser",
          "golines",
          "gomodifytags",
          "staticcheck",
          "delve",

          -- HTML
          "htmlhint",
          "htmlbeautifier",

          -- YAML
          "yamllint",

          -- Lua
          "stylua",

          -- JS/TS
          "prettier",
        },
      })
    end,
  },
}
