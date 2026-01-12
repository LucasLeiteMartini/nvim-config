vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.g.mapleader = " "

vim.opt.textwidth = 120
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

local _border = "rounded"

-- defining borders to lsp previews like hover, function signature, etc.
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or _border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- When using Windows, configure clipboard to use win32yank
vim.g.clipboard = {

  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.filetype.add({
  filename = {
    [".env*"] = "config",
    [".todo"] = "txt",
  },
  pattern = {
    ["requ.*.txt"] = "requirements",
    ["gitconf.*"] = "gitconfig",
    ["*.Dockerfile.*"] = "dockerfile",
  },
})

vim.opt.fileformat = "unix"

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
  float = {
    show_header = true,
    source = "if_many",
    border = "rounded",
    focusable = false,
  },
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})
