return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {

      server = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
          },
        },
      },

      tools = {
        float_win_config = {
          border = "rounded",
          auto_focus = true,
        },
      },
    }
  end,
}
