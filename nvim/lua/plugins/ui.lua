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
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          "git"
        }
      },
      sections = {
        lualine_c = {
          {
            "filename",
            newfile_status = true,
            symbols = {
              modified = '●',
              readonly = '[readonly]',
              unnamed = '[no name]',
              newfile = '[new]'
            }
          }, 
          {
            "buffers",
            hide_filename_extension = true,
            mode = 2,
            symbols = {
              alternate_file = "^",
            }
          }
        },
        lualine_x = {
          "lsp_status", 
          "encoding",
          "fileformat",
          "filetype"
        }
      },
      extensions = {
        "fugitive",
        "fzf",
        "lazy",
        "man",
        "mason",
        "oil",
        "trouble"
      }
    }
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
