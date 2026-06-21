return {
   "ibhagwan/fzf-lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   cmd = "FzfLua",
   config = true,
   keys = {
      {
         "<Leader>f",
         function()
            require("fzf-lua").global()
         end,
         desc = "FZF combo"
      },
      {
         "<Leader>g",
         function()
            require("fzf-lua").live_grep_native()
         end,
         desc = "FZF live grep"
      },
      {
         "<Leader>r",
         function()
            require("fzf-lua").resume()
         end,
         desc = "FZF resume"
      },
      {
         "<Leader>a",
         ":FzfLua<Cr>",
         desc = "FZF picker select"
      }
   }
}
