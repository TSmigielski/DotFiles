vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.listchars = "tab:> ,trail:-,nbsp:+,extends:~,precedes:~"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 16
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

vim.opt.mouse = ""


vim.opt.breakindent = true
vim.opt.signcolumn = "auto"
vim.opt.completeopt = "menuone,noselect"
vim.o.termguicolors = true

-- Open in last position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})
