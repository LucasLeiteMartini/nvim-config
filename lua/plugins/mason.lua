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
          "emmet_language_server",
          "gopls",
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
          "gofumpt",
          "goimports-reviser",
          "golines",
          "gomodifytags",
          "impl",
          "staticcheck",
          "delve",
          "htmlhint",
          "yamllint",
          "htmlbeautifier",
          "stylua",
          "prettier",
        },
      })
    end,
  },
}
