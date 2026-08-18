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
            enabled = true,
            preset = {
               keys = {
                  { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "g", desc = "Live Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
                  { icon = " ", key = "o", desc = "Old Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                  { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                  { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
               }
            }
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
