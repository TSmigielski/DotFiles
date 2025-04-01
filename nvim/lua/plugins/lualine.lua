local white = {
   fg = "#f4f4ee"
}

return {
   "nvim-lualine/lualine.nvim",
   lazy = false,
   dependencies = {
      "folke/noice.nvim"
   },
   opts = {
      options = {
         icons_enabled = true,
         theme = "codedark",
         component_separators = "",
         section_separators = "",
         disabled_filetypes = {
            "git"
         },
         ignore_focus = {
            "query"
         }
      },
      sections = {
         lualine_c = {
            {
               "filename",
               newfile_status = true,
               path = 4,
               symbols = {
                  modified = '●',
                  readonly = '[readonly]',
                  unnamed = '[no name]',
                  newfile = '[new]'
               },
               color = white
            }
         },
         lualine_x = {
            {
               require("noice").api.statusline.mode.get,
               cond = require("noice").api.statusline.mode.has,
               color = { fg = "#ff9e64" }
            }
         },
         lualine_y = {
            {
               "lsp_status",
               color = white
            },
            {
               "encoding",
               color = white
            },
            {
               "fileformat",
               color = white
            },
            {
               "filetype",
               color = white
            },
            "progress"
         }
      },
      inactive_sections = {
         lualine_x = {
            "filetype"
         }
      },
      tabline = {
         lualine_a = {
            {
               "buffers",
               mode = 2,
               symbols = {
                  alternate_file = "^",
               }
            }
         },
         lualine_x = {
            "searchcount",
            "selectioncount"
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
}
