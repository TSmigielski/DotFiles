return {
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" }
   },

   {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "saadparwaiz1/cmp_luasnip",
         "onsails/lspkind.nvim"
      }
   },

   {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
         "rafamadriz/friendly-snippets"
      }
   },

   {
      "folke/trouble.nvim",
      event = "VeryLazy",
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
      }
   },

   {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
         library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } }
         }
      }
   },

   {
      "GodOfAvacyn/gdshader-lsp",
      ft = "gdshader",
      config = function (plugin, opts)
         function gdshader()
            vim.lsp.start {
               name = "gdshader-lsp",
               cmd = {
                  "/usr/local/bin/gdshader-lsp",
               },
               capabilities = vim.lsp.protocol.make_client_capabilities()
            }
         end
      end
   }
}
