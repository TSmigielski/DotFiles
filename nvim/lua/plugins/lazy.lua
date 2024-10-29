require("lazy").setup({

  -- Theme & UI
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true
    },
    config = function(_, opts)
      require("vscode").setup(opts)
      require("vscode").load()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "codedark",
        component_separators = "|",
        section_separators = "",
      }
    }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { }
  },

  {
    "folke/which-key.nvim",
    opts = { }
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" }
      }
    }
  },

  {
    "j-hui/fidget.nvim",
    opts = { }
  },

  -- Core
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "lua", "javascript", "vimdoc", "vim", "html", "css", "bash", "json", "passwd", "xml", "yaml" },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
    },
    build = ":TSUpdate"
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    specs = {
      "nvim-telescope/telescope-file-browser.nvim"
    }
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    opts = { }
  },

  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",

  -- Useability
  {
    "kylechui/nvim-surround",
    opts = { }
  },

  {
    "nguyenvukhang/nvim-toggler",
    opts = {
      inverses = {
        ["up"] = "down",
        ["top"] = "bottom",
        ["left"] = "right",
      }
    }
  },

  "sbdchd/neoformat",
  "tpope/vim-sleuth"
}, {})
