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

      pcall(require("telescope").load_extension, "fzf")
      local previewer_utils = require("telescope.previewers.utils")
      previewer_utils.ts_highlighter = function(bufnr, ft)
        if not ft or ft == "" then
          return false
        end
        local lang = vim.treesitter.language.get_lang(ft) or ft
        local ok = pcall(vim.treesitter.start, bufnr, lang)
        return ok
      end
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require("telescope.builtin")

      local function telescope_live_grep_open_files()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>bf", builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set("n", "<leader>fa", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, { desc = "[F]ind [A]ll files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>of", telescope_live_grep_open_files, {})
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
