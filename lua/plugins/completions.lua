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

      local cmp_kinds = {
        Text = "󰉿",
        Method = "󰆧",

        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",

        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",

        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }

      require("blink.cmp").setup({
        appearance = {

          kind_icons = cmp_kinds,
          use_nvim_cmp_as_default = false,
        },

        completion = {
          list = {

            selection = {
              preselect = true,

              auto_insert = false,
            },
          },

          menu = {
            border = "rounded",
            draw = {
              columns = {
                { "label",     "label_description", gap = 1 },
                { "kind_icon", "kind",              gap = 1 },
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
            "lsp",
            "snippets",
            "path",
            "buffer",
          },
        },

        keymap = {

          preset = "enter",

          ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide" },
          ["<C-b>"] = { "scroll_documentation_up" },
          ["<C-f>"] = { "scroll_documentation_down" },

          ["<CR>"] = { "accept", "fallback" },
        },
      })
    end,
  },
}
