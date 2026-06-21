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
      priority = 800,
      lazy = false,
      opts = {
         bigfile = {
            enabled = true
         },
         dashboard = {
            enabled = true
         },
         input = {
            enabled = true
         },
         styles = {
            input = {
               backdrop = true
            }
         }
      }
   },

   {
      "j-hui/fidget.nvim",
      lazy = false,
      priority = 500,
      opts = {
         display = {
            done_ttl = 5
         },
         notification = {
            override_vim_notify = true
         }
      }
   }
}
