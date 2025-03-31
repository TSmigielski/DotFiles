local quickScopeKeys = { "f", "F", "t", "T" }

return {
  "stevearc/vim-arduino",
  "rhysd/vim-clang-format",

  {
    "tpope/vim-fugitive",
    event = "VeryLazy"
  },

  {
    "tpope/vim-sleuth",
    event = "BufReadPre"
  },

  {
    "prettier/vim-prettier",
    event = "VeryLazy"
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = { }
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      view_options = {
        show_hidden = true
      }
    }
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    opts = { },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = { }
  },

  {
    "unblevable/quick-scope",
    keys = quickScopeKeys,
    init = function()
      vim.g.qs_highlight_on_keys = quickScopeKeys
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
}
