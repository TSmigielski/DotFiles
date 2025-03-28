-- Set leader as soon as possible
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[
  let $LC_ALL = "en_US.UTF-8"
]])

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins first
require("lazy").setup("plugins", {
  defaults = {
    lazy = true
  }
})

-- Then load the config, to potentially override plugin defaults
require("config")

-- Start a server for the first neovim instance
local serverPath = vim.fn.expand("~") .. "/.cache/nvim/instance"
if vim.fn.filereadable(serverPath) == 0 then
  vim.fn.serverstart(serverPath)
end
