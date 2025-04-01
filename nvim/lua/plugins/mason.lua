return {
   {
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
      "williamboman/mason-lspconfig.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         "williamboman/mason.nvim"
      },
      opts = {
         handlers = {
            function(server_name)
               require("lspconfig")[server_name].setup({})
            end
         }
      }
   }
}
