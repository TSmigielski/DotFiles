return {
   {
      "nvim-treesitter/nvim-treesitter",
      main = "nvim-treesitter.configs",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         ensure_installed = { "lua", "javascript", "vimdoc", "vim", "html", "css", "bash", "json", "yaml" },
         auto_install = true,
         sync_install = false,
         ignore_install = {},
         modules = {},
         highlight = { enable = true }
      },
      build = ":TSUpdate"
   },

   {
      "nvim-treesitter/nvim-treesitter-context",
      event = "VeryLazy",
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      }
   },

   {
      "GodOfAvacyn/tree-sitter-gdshader",
      ft = "gdshader",
      config = function(plugin, opts)
         local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
         parser_config.gdshader = {
            install_info = {
               url = "/home/ts-pl/.local/share/nvim/lazy/tree-sitter-gdshader",
               files = {
                  "src/parser.c"
               }
            },
            filetype = "gdshader"
         }
      end
   }
}
