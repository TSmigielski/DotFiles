return {
   {
      "romus204/tree-sitter-manager.nvim",
      event = { "BufReadPre", "BufNewFile" }, -- For the auto install
      opts = {
         auto_install = true
      }
   },

   {
      "windwp/nvim-ts-autotag",
      event = { "BufReadPre", "BufNewFile" },
      config = true
   },

   {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         multiline_threshold = 1
      }
   }
}
