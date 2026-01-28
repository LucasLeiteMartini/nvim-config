return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    build = "cargo build --release",
    dependencies = {
      "L3MON4D3/LuaSnip",

      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },

    config = function()
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      require("blink.cmp").setup({
        appearance = {

          nerd_font_variant = "mono",
          kind_icons = {
            provider = "mini.icons",
          },
          use_nvim_cmp_as_default = false,
        },

        signature = {
          enabled = true,
          window = {
            border = "rounded",
          },
        },

        completion = {
          list = {

            selection = {
              preselect = true,

              auto_insert = true,
            },
          },

          menu = {
            border = "rounded",
            draw = {
              columns = {
                { "label", "label_description", gap = 1 },
                { "kind_icon", "kind", gap = 1 },
              },
            },
          },

          documentation = {

            auto_show = true,
            window = {
              border = "rounded",
            },
          },
        },

        snippets = {
          expand = function(snippet)
            luasnip.lsp_expand(snippet)
          end,
          active = function(filter)
            return luasnip.in_snippet()
          end,
          jump = function(direction)
            if direction == 1 then
              luasnip.jump(1)
            else
              luasnip.jump(-1)
            end
          end,
        },

        sources = {
          default = {
            "lazydev",
            "lsp",
            "snippets",
            "path",
            "buffer",
          },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },

        keymap = {

          preset = "enter",

          ["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide" },
          ["<CR>"] = { "accept", "fallback" },
        },
      })
    end,
  },
}
