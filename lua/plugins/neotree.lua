return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,

  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    hide_root_node = true,
    filesystem = {
      filtered_items = {
        show_hidden_count = true,
        hide_dotfiles = true, -- Controla a exibição de arquivos iniciados com ponto (.)
        hide_gitignored = true, -- Esconde arquivos ignorados pelo Git
        hide_by_name = {
          ".git",
        },
        always_show = {
          ".env",
        },
      },
    },
    auto_refresh = true,
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
