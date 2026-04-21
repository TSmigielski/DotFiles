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
      opts = { }
   },

   {
      "lewis6991/gitsigns.nvim",
      event = "VeryLazy",
      opts = {
         sign_priority = 100
      }
   },

   {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
         dashboard = { enabled = true },
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
