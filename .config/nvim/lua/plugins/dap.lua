return {
   {
      "mfussenegger/nvim-dap",
      dependencies = {
         "igorlfs/nvim-dap-view"
      },
      config = function()
         local dap, dapview = require("dap"), require("dap-view")

         dap.listeners.before.attach.dapui_config = function()
            dapview.open()
         end
         dap.listeners.before.launch.dapui_config = function()
            dapview.open()
         end
         dap.listeners.before.event_terminated.dapui_config = function()
            dapview.close()
         end
         dap.listeners.before.event_exited.dapui_config = function()
            dapview.close()
         end

         vim.fn.sign_define("DapBreakpoint", { text = "" })
         vim.fn.sign_define("DapBreakpointCondition", { text = "" })
         vim.fn.sign_define("DapBreakpointRejected", { text = "" })
         vim.fn.sign_define("DapLogPoint", { text = "" })
         vim.fn.sign_define("DapStopped", { text = "" })
      end,
      keys = {
         { "<F4>",    ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
         { "<F5>",    ":DapContinue<CR>",         desc = "Continue debugging" },
         { "<S-F5>",  ":DapTerminate<CR>",        desc = "Terminate debugging" },
         { "<F10>",   ":DapStepOver<CR>",         desc = "Step over" },
         { "<F11>",   ":DapStepInto<CR>",         desc = "Step into" },
         { "<S-F11>", ":DapStepOut<CR>",          desc = "Step out" }
      }
   },

   {
      "jbyuki/one-small-step-for-vimkind",
      dependencies = "mfussenegger/nvim-dap",
      ft = "lua",
      config = function()
         local dap = require("dap")
         dap.configurations.lua = {
            {
               type = "nlua",
               request = "attach",
               name = "Attach to running Neovim instance"
            }
         }
         dap.adapters.nlua = function(callback, config)
            callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
         end
      end
   }
}
