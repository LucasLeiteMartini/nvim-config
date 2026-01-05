return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      -- Configuração do Servidor (Language Server)
      server = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
          },
        },
      },

      -- 2. Configuração Visual (AQUI ESTÁ O SEGREDO)
      -- Isso força as janelas do Rust (Hover, Explain Error, etc) a usarem bordas
      tools = {
        float_win_config = {
          border = "rounded", -- Igual ao resto do seu editor
          auto_focus = true, -- Opcional: foca na janela se abrir
        },
      },
    }
  end,
}
