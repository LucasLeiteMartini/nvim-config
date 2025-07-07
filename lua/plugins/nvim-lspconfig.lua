return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.gopls.setup({
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          gofumpt = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.html.setup({
      capabilities = capabilities,
    })
    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,

      lspconfig.emmet_language_server.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "pug",
          "typescript",
          "typescriptreact",
        },
        -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
        -- **Note:** only the options listed in the table are supported.
        init_options = {
          ---@type table<string, string>
          includeLanguages = {},
          --- @type string[]
          excludeLanguages = {},
          --- @type string[]
          extensionsPath = {},
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          preferences = {},
          --- @type boolean Defaults to `true`
          showAbbreviationSuggestions = true,
          --- @type "always" | "never" Defaults to `"always"`
          showExpandedAbbreviation = "always",
          --- @type boolean Defaults to `false`
          showSuggestionsAsSnippets = true,
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          syntaxProfiles = {},
          --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          variables = {},
        },
      }),
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })
    lspconfig.spectral.setup({
      capabilities = capabilities,
      cmd = {
        "node",
        "/home/lucas/.local/share/nvim/mason/packages/spectral-language-server/spectral-1.1.4/extension/server/index.js",
        "--stdio",
      },
      filetypes = { "json", "yaml" },
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
