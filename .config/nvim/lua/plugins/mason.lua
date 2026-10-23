return {
   {
      -- Package manager for LSPs
      "mason-org/mason.nvim",
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
      "mason-org/mason-lspconfig.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = true
   }
}
