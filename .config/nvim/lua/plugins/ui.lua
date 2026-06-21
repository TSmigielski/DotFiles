return {
   {
      "Mofiqul/vscode.nvim",
      priority = 1000,
      lazy = false,
      config = function()
         require("vscode").setup({
            transparent = true,
            italic_comments = true
         })

         vim.cmd.colorscheme("vscode")
      end
   },

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
         delay = 666
      }
   },

   {
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         sign_priority = 100
      }
   },

   {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
         dashboard = {
            enabled = true,
            preset = {
               keys = {
                  { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "g", desc = "Find Text", action = ":FzfLua live_grep" },
                  { icon = " ", key = "r", desc = "Recent Files", action = ":FzfLua oldfiles" },
                  { icon = " ", key = "c", desc = "Config", action = ":FzfLua files cwd=~/.config/nvim" },
                  { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" }
               }
            }
         },
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
      enabled = false,
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
