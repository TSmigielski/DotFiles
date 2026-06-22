vim.filetype.add({
   extension = {
      axaml = "xml",
      log = "log"
   },
   pattern = {
      ["appsettings.json"] = "jsonc",
      ["appsettings.*.json"] = "jsonc"
   }
})
