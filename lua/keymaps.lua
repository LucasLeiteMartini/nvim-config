-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", { silent = true })

-- move lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- vim-tmux-navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- save file normal/insert mode
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>")

-- lsp features
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "<leader>i", vim.lsp.buf.format, {})

-- qol
vim.keymap.set("n", "<leader>v", "V", {})
vim.keymap.set("n", "<leader>o", "O", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", ' "_dP ')
vim.keymap.set("n", "<leader>td", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end)
vim.keymap.set("n", "<TAB>", vim.cmd.bnext, {})
vim.keymap.set("n", "<S-TAB>", vim.cmd.bprev, {})
vim.keymap.set("n", "<M-c>", vim.cmd.bdelete, {})
