return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        go = { "gofumpt", "goimports-reviser", "golines" },
        python = { "isort", "black" },
        html = { "htmlbeautifier" },
        prisma = { "prisma_format" },
        lua = { "stylua" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        markdown = { "prettier" },
      },
      formatters = {
        black = {
          append_args = {
            "--line-length",
            "88",
          },
        },
        stylua = {
          append_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        },
      },
      format_on_save = function(bufnr)
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end
        -- ...additional logic...
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end,
    })
  end,
}
