-- neotree binding
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")

-- vim motions in insert mode
vim.keymap.set("i", "<C-h>", "<C-Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<C-Right>")
vim.keymap.set("i", "<M-h>", "<Left>")
vim.keymap.set("i", "<M-l>", "<Right>")

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

-- window split
vim.keymap.set("n", "<C-\\>", ":vsplit<CR>")
vim.keymap.set("n", "<C-S-\\>", ":split<CR>")

-- save file normal/insert mode
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>")

-- lsp features
vim.keymap.set("n", "<leader>nr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "<leader>i", vim.lsp.buf.format, {})

-- qol
vim.keymap.set("n", "<leader>v", "V", {})
vim.keymap.set("n", "<leader>o", "O", {})
