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
    build = ":TSUpdate",
    specs = {
      "nvim-treesitter/nvim-treesitter-context"
    }
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
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x"
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    }
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    }
  },

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
