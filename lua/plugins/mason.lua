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
          "dockerls",
          "docker_compose_language_service",
          "emmet_language_server",
          "fish_lsp",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "prismals",
          "pyright",
          "ts_ls",
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
