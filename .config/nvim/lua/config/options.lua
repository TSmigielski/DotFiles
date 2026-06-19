vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.listchars = "tab:> ,trail:-,nbsp:+,extends:~,precedes:~"

vim.opt.tabstop = 3
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 16
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50
vim.opt.termguicolors = true

vim.opt.breakindent = true
vim.opt.signcolumn = "auto:1-2"
vim.opt.completeopt = "menuone,noselect"

vim.opt.splitright = true
vim.opt.splitbelow = true
