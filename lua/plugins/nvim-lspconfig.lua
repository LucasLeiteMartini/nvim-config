return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    -- RUST RELATED CONFIGURATION
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = args.buf, silent = true }

        if client.name == "rust-analyzer" then
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, opts)

          vim.keymap.set({ "n", "v" }, "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, opts)
        end
      end,
    })

    local default_server = {
      dockerls = {},
      docker_compose_language_service = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = true },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = {},
      lemminx = {},
      html = {},
      cssls = {},
      jsonls = {},
      fish_lsp = {},
      prismals = {},
      pyright = {},
      marksman = {},
      tombi = {},
      yamlls = {},
      angularls = {},

      emmet_language_server = {
        settings = {
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
          init_options = {
            showAbbreviationSuggestions = true,
            showExpandedAbbreviation = "always",
            showSuggestionsAsSnippets = true,
          },
        },
      },

      gopls = {
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
      },
    }

    for server, config in pairs(default_server) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
