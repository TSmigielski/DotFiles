return {
   -- "nguyenvukhang/nvim-toggler",
   "TSmigielski/nvim-toggler",
   -- dir = "/home/ts-pl/Projects/OpenSource/Forks/nvim-toggler",
   keys = "<leader>i",
   opts = {
      remove_default_inverses = true,
      inverses = {
         ["true"] = "false",
         ["yes"] = "no",
         ["on"] = "off",
         ["left"] = "right",
         ["up"] = "down",
         ["enable"] = "disable",
         ["enabled"] = "disabled",
         ["!="] = "==",
         ["top"] = "bottom",
         ["low"] = "high",
         ["show"] = "hide",
         ["open"] = "close",
         ["private"] = "public"
      }
   }
}
