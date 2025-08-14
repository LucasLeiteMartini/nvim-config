return {
  "nvimtools/none-ls.nvim",

  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        }),
        null_ls.builtins.formatting.htmlbeautifier,
        null_ls.builtins.formatting.prisma_format,
        null_ls.builtins.formatting.prettier.with({}),
      },
    })
  end,
}
