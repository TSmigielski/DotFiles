return {
   "carlos-algms/agentic.nvim",
   opts = {
      provider = "claude-agent-acp",
      diff_preview = {
         enabled = true,
         layout = "inline"
      }
   },

   keys = {
      {
         "<C-\\>",
         function() require("agentic").toggle() end,
         desc = "Toggle Agentic Chat"
      },
      {
         "<C-'>",
         function() require("agentic").add_selection_or_file_to_context() end,
         mode = { "n", "v" },
         desc = "Add file or selection to Agentic to Context"
      },
      {
         "<C-,>",
         function() require("agentic").new_session() end,
         desc = "New Agentic Session"
      },
      {
         "<leader>ar", -- ai Restore
         function()
            require("agentic").restore_session()
         end,
         desc = "Agentic Restore session",
         silent = true
      },
      {
         "<leader>ad", -- ai Diagnostics
         function()
            require("agentic").add_current_line_diagnostics()
         end,
         desc = "Add current line diagnostic to Agentic"
      },
      {
         "<leader>aD", -- ai all Diagnostics
         function()
            require("agentic").add_buffer_diagnostics()
         end,
         desc = "Add all buffer diagnostics to Agentic"
      }
   }
}
