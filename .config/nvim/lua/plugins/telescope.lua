local openWithTrouble = require("trouble.sources.telescope").open

return {
   {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
               return vim.fn.executable "make" == 1
            end,
         },
      },
      specs = {
         "nvim-telescope/telescope-file-browser.nvim"
      },
      opts = {
         defaults = {
            mappings = {
               i = {
                  ["<C-u>"] = false,
                  ["<C-d>"] = false,
                  ["<C-j>"] = "move_selection_next",
                  ["<C-k>"] = "move_selection_previous",
                  ["<C-t>"] = openWithTrouble
               },
               n = {
                  ["<C-t>"] = openWithTrouble
               }
            }
         }
      },
      config = function(plugin, opts)
         local telescope = require("telescope")
         telescope.setup(opts)
         telescope.load_extension("fzf")
         telescope.load_extension("file_browser")
      end
   }
}
