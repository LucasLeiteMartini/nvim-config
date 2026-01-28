return {
  "folke/snacks.nvim",
  priority = 1000,
  opts = {
    notifier = {
      enabled = true,
      width = { min = 20, max = 0.5 },
      level = vim.log.levels.TRACE,
      style = "fancy",
    },
    indent = { enabled = true, char = "┃" },
  },
}
