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
    "nvim-lualine/lualine.nvim",
    lazy = false,
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
    event = "BufReadPre",
    opts = { }
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
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = { }
  }
}
