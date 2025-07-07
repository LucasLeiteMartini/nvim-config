return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
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
        show_hidden_count = false,
        hide_dotfiles = false,   -- Controla a exibição de arquivos iniciados com ponto (.)
        hide_gitignored = false, -- Esconde arquivos ignorados pelo Git
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
