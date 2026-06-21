local quickScopeKeys = { "f", "F", "t", "T" }

-- Small QOL plugins and ones that improve on an existing functionality.

return {
   {
      "kylechui/nvim-surround",
      keys = {"ys", "ds", "cs"}
   },

   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true
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
      event = { "BufRead", "BufNewFile" },
      opts = {
         animate = {
            duration = {
               step = 10,
               total = 50
            }
         },
         debounce_timeout = 80
      },
      config = function(_, opts)
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
   },

   {
      "mluders/comfy-line-numbers.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = true
   },

   {
      "ysmb-wtsg/in-and-out.nvim",
      keys = {
         {
            "<C-CR>",
            function()
               require("in-and-out").in_and_out()
            end,
            mode = {"n", "i", "v"}
         }
      },
   }
}
