return {
  "nvim-treesitter/nvim-treesitter",
  branc = 'master',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({
      auto_install = true,
      highlight = {enable = true},
      indent = {enable = true},
    })
  end
}

