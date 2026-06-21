return {
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
      cmd = { "G", "Git", "Gedit", "Gsplit", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "Glgrep", "GMove", "GDelete", "GBrowse" }
   },

   {
      "prettier/vim-prettier",
      keys = "<Leader>p",
      cmd = { "Prettier", "PrettierAsync", "PrettierPartial", "PrettierFragment", "PrettierVersion", "PrettierCli", "PrettierCliPath", "PrettierCliVersion" }
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
      },
      keys = {
         { "-", ":Oil<Cr>", desc = "Open parent directory" }
      }
   },

   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = "cd app && yarn install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end
   },

   {
      "uga-rosa/ccc.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         highlighter = {
            auto_enable = true,
            lsp = true
         }
      },
      config = function(plugin, opts)
         vim.opt.termguicolors = true;
         require("ccc").setup(opts)
      end,
      keys = {
         { "<Leader>c", ":CccPick<Cr>", desc = "Color picker" }
      }
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
      config = true
   }
}
