return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = { "lua", "javascript", "vimdoc", "vim", "html", "css", "bash", "json", "passwd", "xml", "yaml" },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
    },
    build = ":TSUpdate"
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  }
}
