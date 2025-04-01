local highlight = { 
   "RainbowDelimiterRed",
   "RainbowDelimiterYellow",
   "RainbowDelimiterBlue",
   "RainbowDelimiterOrange",
   "RainbowDelimiterGreen",
   "RainbowDelimiterViolet",
   "RainbowDelimiterCyan",
}

return {
   {
      "HiPhish/rainbow-delimiters.nvim",
      event = "BufReadPre",
      init = function()
         vim.g.rainbow_delimiters = {
            strategy = {
               [''] = 'rainbow-delimiters.strategy.global'
            },
            query = {
               [''] = 'rainbow-delimiters'
            },
            highlight = highlight
         }
      end
   },

   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = "BufReadPre",
      opts = {
         scope = {
            highlight = highlight,
            show_end = false,
            include = {
               node_type = {
                  c_sharp = {
                     "class_declaration",
                     "method_declaration",
                     "variable_declaration",
                     "local_function_statement",
                     "if_statement",
                     "for_statement",
                     "foreach_statement",
                     "switch_statement",
                     "switch_section"
                  },
                  lua = {
                     "table_constructor",
                     "expression_list"
                  }
               }
            },
            exclude = {
               node_type = {
                  c_sharp = {
                     "block"
                  }
               }
            }
         }
      },
      config = function(plugin, opts)
         require("ibl").setup(opts)
         local hooks = require("ibl.hooks")
         hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
         )
      end
   }
}
