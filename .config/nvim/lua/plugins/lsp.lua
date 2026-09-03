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
         "onsails/lspkind.nvim",
         "FelipeLema/cmp-async-path"
      }
   },

   {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      build = "make install_jsregexp",
      config = function()
         local luasnip = require("luasnip")
         luasnip.add_snippets("cs", require("snippets.cs"))
      end,
      keys = {
         {
            "<Tab>",
            function()
               local luasnip = require("luasnip")
               if luasnip.jumpable(1) then
                  luasnip.jump(1)
               elseif vim.fn.mode() == "i" then
                  return "<Tab>"
               end
            end,
            desc = "Jump to next snippet part",
            mode = { "n", "i", "v" },
            expr = true
         },
         {
            "<S-Tab>",
            function()
               local luasnip = require("luasnip")
               if luasnip.jumpable(-1) then
                  luasnip.jump(-1)
               elseif vim.fn.mode() == "i" then
                  return "<BS>"
               end
            end,
            desc = "Jump to previous snippet part",
            mode = { "n", "i", "v" },
            expr = true
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
      config = function(_, _)
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
   },

   {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      event = "LspAttach",
      config = function(_, _)
         vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true
         })
         require("lsp_lines").setup()
      end,
      keys = {
         {
            "<Leader>u",
            function()
               require("lsp_lines").toggle()
            end,
            desc = "Toggle LSP lines"
         }
      }
   }
}
