return {
   "folke/trouble.nvim",
   cmd = "Trouble",
   opts = {
      modes = {
         diagnostics = {
            auto_close = true,
            warn_no_results = false
         },
         lsp = {
            open_no_results = true
         }
      }
   },
   keys = {
      { "<Leader>tt", ":Trouble diagnostics toggle<CR>", desc = "Toggle diagnostics" },
      {
         "<Leader>ts",
         function()
            local trouble = require("trouble")
            if (trouble.is_open("lsp")) then
               trouble.close("lsp")
               trouble.open("symbols")
               return
            end
            trouble.toggle("symbols")
         end,
         desc = "Toggle symbols"
      },
      {
         "<Leader>tl",
         function()
            local trouble = require("trouble")
            local lsp = {
               mode = "lsp",
               win = {
                  position = "right"
               }
            }
            if (trouble.is_open("symbols")) then
               trouble.close("symbols")
               trouble.open(lsp)
               return
            end
            trouble.toggle(lsp)
         end,
         desc = "Toggle definitions"
      },
      {
         "<Leader>tc",
         function()
            local trouble = require("trouble")
            trouble.close("lsp")
            trouble.close("symbols")
         end,
         desc = "Close windows"
      }
   }
}
