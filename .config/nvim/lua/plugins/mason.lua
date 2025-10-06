return {
   {
      -- Package manager for LSPs
      "williamboman/mason.nvim",
      cmd = "Mason",
      opts = {
         registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry"
         }
      }
   },

   {
      -- Automatically enables all installed LSPs
      "williamboman/mason-lspconfig.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = { }
   }
}
