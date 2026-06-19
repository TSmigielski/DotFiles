return {
   {
      "stevearc/vim-arduino",
      ft = "arduino"
   },

   {
      "rhysd/vim-clang-format",
      ft = {
         "arduino",
         "c",
         "cpp",
         "h"
      }
   },

   {
      "tpope/vim-fugitive",
      event = "VeryLazy"
   },

   {
      "prettier/vim-prettier",
      event = "VeryLazy"
   },

   {
      "stevearc/oil.nvim",
      lazy = false,
      opts = {
         skip_confirm_for_simple_edits = true,
         watch_for_changes = true,
         view_options = {
            case_insensitive = true,
            is_hidden_file = function(name, bufnr)
               local patterns = {
                  "^%.",
                  "%.uid$"
               }

               for i, pattern in ipairs(patterns) do
                  if (name:match(pattern) ~= nil) then
                     return true
                  end
               end

               return false
            end
         }
      }
   },

   {
      enabled = false,
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      },
      opts = { },
   },

   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
   },

   {
      "uga-rosa/ccc.nvim",
      lazy = false,
      opts = {
         highlighter = {
            auto_enable = true,
            lsp = true
         }
      },
      config = function (plugin, opts)
         vim.opt.termguicolors = true;
         require("ccc").setup(opts)
      end
   },

   {
      "lambdalisue/vim-suda",
      cmd = { "SudaWrite", "SudaRead" }
   },

   {
      "EL-MASTOR/bufferlist.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      keys = { { "<Leader><Leader>", ':BufferList<CR>', desc = "Open bufferlist" } },
      cmd = "BufferList",
      opts = { }
   }
}
