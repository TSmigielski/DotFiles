local white = {
   fg = "#f4f4ee"
}

local function getLineY(dotnet)
   local line = {
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

   if dotnet ~= nil then
      table.insert(line, 1, {
         dotnet.lualine.run_status,
         color = dotnet.lualine.run_status_color
      })

      table.insert(line, 1, {
         dotnet.lualine.jobs,
         color = white
      })
   end

   return line
end

function ReconfigureLuaLine(dotnet)
   require("lualine").setup({
      sections = {
         lualine_y = getLineY(dotnet)
      }
   })
end

return {
   "nvim-lualine/lualine.nvim",
   lazy = false,
   -- dependencies = {
   --    "folke/noice.nvim"
   -- },
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
            -- {
            --    require("noice").api.statusline.mode.get,
            --    cond = require("noice").api.statusline.mode.has,
            --    color = { fg = "#ff9e64" }
            -- }
         },
         lualine_y = getLineY(nil)
      },
      inactive_sections = {
         lualine_x = {
            "filetype"
         }
      },
      extensions = {
         "fugitive",
         "lazy",
         "man",
         "mason",
         "oil",
         "trouble"
      }
   }
}
