return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },

  build = function()
    require("blink.cmp").build():pwait()
  end,

  opts = {

    appearance = {

      nerd_font_variant = "mono",
      use_nvim_cmp_as_default = false,
    },

    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_trigger_character = true,
        show_on_insert = true,
        show_on_insert_on_trigger_character = true,
      },
      window = {
        border = "rounded",
        show_documentation = true,
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

      accept = {
        auto_brackets = { enabled = true },
      },
    },

    snippets = {
      preset = "luasnip",
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
      preset = "default",

      ["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },
      ["<C-k>"] = { "show_signature", "hide_signature" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<C-n>"] = { "select_next" },
      ["<C-p>"] = { "select_prev" },
    },
  },
}
