-- Ctrl+HJKL movement
vim.keymap.set({"i","n"}, "<C-h>", "<Left>")
vim.keymap.set({"i","n"}, "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<C-o>g<Down>")
vim.keymap.set("i", "<C-k>", "<C-o>g<Up>")
vim.keymap.set("n", "<C-j>", "g<Down>")
vim.keymap.set("n", "<C-k>", "g<Up>")

-- Move between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Keep the screen centered when using these motions
vim.keymap.set("n", "<C-d>", "M<C-d>")
vim.keymap.set("n", "<C-u>", "M<C-u>")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", Desc("Move selected text down a line"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", Desc("Move selected text up a line"))

-- Register shenanigans
vim.keymap.set("x", "<leader>p", [["_dP]], Desc("Paste without losing register"))
vim.keymap.set({"n","v"}, "<leader>y", [["+y]], Desc("Yank into system clipboard"))
vim.keymap.set({"n","v"}, "<leader>D", [["_d]], Desc("Delete to discard register"))

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- QOL
vim.keymap.set("i", "<C-c>", "<esc>") -- Ctrl + C == Esc
vim.keymap.set("n", "Q", "<nop>") -- Disable Q
vim.keymap.set("n", "J", "mzJ`z") -- Keep cursor in place during J
vim.keymap.set("n", "gh", ":help <C-r><C-w><CR>", Desc("Goto help files (horizontal)"))
vim.keymap.set("n", "gvh", ":vert help <C-r><C-w><CR>", Desc("Goto help files (vertical)"))
