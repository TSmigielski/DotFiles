vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.listchars = "tab:> ,trail:-,nbsp:+,extends:~,precedes:~"

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.ignorecase = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 16
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50
vim.opt.mouse = ""
vim.opt.termguicolors = true

vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menuone,noselect"
vim.o.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true
