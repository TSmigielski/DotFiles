return {
   "GustavEikaas/easy-dotnet.nvim",
   ft = {
      "cs",
      "sln",
      "slnx",
      "csproj"
   },
   opts = {
      notifications = {
         handler = false -- Handled by lualine integration
      }
   },
   config = function(_, config)
      local dotnet = require("easy-dotnet")
      dotnet.setup(config)
      require("cmp").register_source("easy-dotnet", dotnet.package_completion_source)
      vim.lsp.enable("easy_dotnet")

      ReconfigureLuaLine(dotnet)
   end
}
