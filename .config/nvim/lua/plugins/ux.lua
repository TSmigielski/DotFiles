local quickScopeKeys = { "f", "F", "t", "T" }

-- Small QOL plugins and ones that improve on an existing functionality.

return {
   {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      opts = { }
   },

   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
      opts = { }
   },

   {
      "unblevable/quick-scope",
      keys = quickScopeKeys,
      init = function()
         vim.g.qs_highlight_on_keys = quickScopeKeys
      end
   },

   {
      "tzachar/local-highlight.nvim",
      event = "BufRead",
      opts = {
         animate = {
            duration = {
               step = 10,
               total = 50
            }
         },
         debounce_timeout = 80
      },
      config = function (_, opts)
         require("local-highlight").setup(opts)
         vim.cmd("highlight LocalHighlight guifg=nil")
      end
   },

   {
      "kevinhwang91/nvim-bqf",
      event = "VeryLazy",
      opts = {
         auto_resize_height = true,
         preview = {
            border = "single",
            winblend = 0
         }
      }
   }
}
