return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = args.buf, silent = true }

        if client.name == "rust-analyzer" then
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, {})
          vim.keymap.set({ "n", "v" }, "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, {})
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end,
    })

    local function enable_server(server_name, config)
      config = config or {}
      config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})

      vim.lsp.config[server_name] = config

      vim.lsp.enable(server_name)
    end

    local default_servers = {
      -- Web related
      "html",
      "cssls",
      "ts_ls",
      "angularls",

      -- JSON
      "jsonls",

      -- FISH
      "fish_lsp",

      -- ORM
      "prismals",

      -- MARKDOWN
      "marksman",

      --DOCKER
      "dockerls",
      "docker_compose_language_service",

      -- PYTHON
      "pyright",

      -- YAML
      "yamlls",
    }

    for _, server in ipairs(default_servers) do
      enable_server(server, {})
    end

    enable_server("lua_ls", {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    enable_server("gopls", {
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
          analyses = { nilness = true, unusedparams = true, unusedwrite = true, useany = true },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    enable_server("emmet_language_server", {
      filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "angular",
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
