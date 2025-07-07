return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/lsp-status.nvim" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
      sections = {
        lualine_c = { "filename", "lsp_progress" },
      },
    })
  end,
}
