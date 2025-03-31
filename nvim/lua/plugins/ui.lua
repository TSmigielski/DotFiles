return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    lazy = false,
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { }
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = { }
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      image = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      styles = {
        input = {
          backdrop = true
        }
      }
    }
  },
  
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      render = "wrapped-compact",
      background_colour = "#000000",
      fps = 60
    }
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    opts = {
      cmdline = {
        format = {
          help = {
            pattern = {
              "^:%s*he?l?p?%s+",
              "^:%s*vert%s*he?l?p?%s+"
            }
          }
        }
      }
    }
  }
}
