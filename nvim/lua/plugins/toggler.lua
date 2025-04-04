return {
   "nguyenvukhang/nvim-toggler",
   keys = "<leader>i",
   opts = {
      inverses = {
         ["up"] = "down",
         ["top"] = "bottom",
         ["left"] = "right",
         ["low"] = "high",
         ["LOW"] = "HIGH",
         ["on"] = "off",
         ["On"] = "Off",
         ["Show"] = "Hide",
         ["show"] = "hide",
         ["open"] = "close",
         ["Open"] = "Close",
         ["enable"] = "disable",
         ["Enable"] = "Disable",
         ["enabled"] = "disabled",
         ["Enabled"] = "Disabled",
      }
   }
}
