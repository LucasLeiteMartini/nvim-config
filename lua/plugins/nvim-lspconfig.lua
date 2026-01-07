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
      "dockerls",
      "docker_compose_language_service",
      "lua_ls",
      "ts_ls",
      "html",
      "emmet_language_server",
      "cssls",
      "jsonls",
      "fish_lsp",
      "prismals",
      "pyright",
      "marksman",
      "tombi",
      "yamlls",
    }

    for _, server in ipairs(default_server) do
      vim.lsp.enable(server)
    end

    vim.lsp.config("gopls", {
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
    })

    vim.lsp.config("emmet_language_server", {
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
