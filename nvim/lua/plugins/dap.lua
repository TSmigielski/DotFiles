return {
   {
      "mfussenegger/nvim-dap",
      dependencies = {
         "rcarriga/nvim-dap-ui",
         "nvim-neotest/nvim-nio"
      },
      config = function()
         local dap, dapui = require("dap"), require("dapui")
         dapui.setup()

         dap.listeners.before.attach.dapui_config = function()
            dapui.open()
         end
         dap.listeners.before.launch.dapui_config = function()
            dapui.open()
         end
         dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
         end
         dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
         end

         vim.fn.sign_define("DapBreakpoint", { text="" })
         vim.fn.sign_define("DapBreakpointCondition", { text="" })
         vim.fn.sign_define("DapBreakpointRejected", { text="" })
         vim.fn.sign_define("DapLogPoint", { text="" })
         vim.fn.sign_define("DapStopped", { text="" })
      end
   },

   {
      "jbyuki/one-small-step-for-vimkind",
      dependencies = "mfussenegger/nvim-dap",
      ft = "lua"
   }
}
