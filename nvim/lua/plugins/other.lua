local quickScopeKeys = { "f", "F", "t", "T" }

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
      "tpope/vim-sleuth",
      event = "BufReadPre"
   },

   {
      "prettier/vim-prettier",
      event = "VeryLazy"
   },

   {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      opts = { }
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
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      },
      opts = { },
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
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
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
      config = function (plugin, opts)
         require("local-highlight").setup(opts)
         vim.cmd("highlight LocalHighlight guifg=nil")
      end
   }
}
