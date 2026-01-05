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

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.filetype.add({
  filename = {
    [".env"] = "config",
    [".todo"] = "txt",
  },
  pattern = {
    ["requ.*.txt"] = "requirements",
    ["gitconf.*"] = "gitconfig",
    ["Dockerfile.*"] = "dockerfile",
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
