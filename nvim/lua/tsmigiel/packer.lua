-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('Mofiqul/vscode.nvim')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('christoomey/vim-tmux-navigator')
    use('freddiehaddad/feline.nvim')
    use('nvim-tree/nvim-web-devicons')
    use('lewis6991/gitsigns.nvim')

    -- LspZero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use('jlcrochet/vim-razor')
    use('jghauser/mkdir.nvim')
    use('nguyenvukhang/nvim-toggler')
    use('jiangmiao/auto-pairs')
    use('hiphish/rainbow-delimiters.nvim')
    use('norcalli/nvim-colorizer.lua')
    use('ziontee113/color-picker.nvim')
    use('lukas-reineke/indent-blankline.nvim')
end)
