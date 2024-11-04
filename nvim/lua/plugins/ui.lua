return {
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
  }
}
