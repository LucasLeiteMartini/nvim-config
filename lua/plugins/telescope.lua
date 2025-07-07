return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")

      pcall(require("telescope").load_extensio, "fzf")
      pcall(require("telescope").load_extensio, "ui-select")

      local builtin = require("telescope.builtin")

      local function bufferFzf()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end

      local function telescope_live_grep_open_files()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>bf", bufferFzf, {})
      vim.keymap.set("n", "<leader>ff", telescope_live_grep_open_files, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    end,
  },
  {
    "cuducos/yaml.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("yaml_nvim").setup({
        ft = { "yaml" }, -- optional
        vim.keymap.set("n", "<leader>sy", ":YAMLTelescope<CR>", { desc = "[S]earch in [Y]aml Files" }),
      })
    end,
  },
}
