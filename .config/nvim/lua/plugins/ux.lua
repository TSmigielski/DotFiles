local quickScopeKeys = { "f", "F", "t", "T" }

-- Small QOL plugins and ones that improve on an existing functionality.

return {
   {
      "kylechui/nvim-surround",
      keys = { "ys", "ds", "cs" }
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
            mode = { "n", "i", "v" }
         }
      },
   },

   {
      "hat0uma/csvview.nvim",
      opts = {
         keymaps = {
            -- Text objects for selecting fields
            textobject_field_inner = { "if", mode = { "o", "x" } },
            textobject_field_outer = { "af", mode = { "o", "x" } },

            -- Excel-like navigation:
            -- Use <Tab> and <S-Tab> to move horizontally between fields.
            -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
            -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
            jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
            jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
            jump_next_row = { "<Enter>", mode = { "n", "v" } },
            jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
         },
      },
      cmd = "CsvViewEnable"
   }
}
