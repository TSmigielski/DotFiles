return {
  "stevearc/vim-arduino",
  "rhysd/vim-clang-format",
  "tpope/vim-sleuth",
  "prettier/vim-prettier",

  {
    "kylechui/nvim-surround",
    opts = { }
  },

  {
    "nguyenvukhang/nvim-toggler",
    opts = {
      inverses = {
        ["up"] = "down",
        ["top"] = "bottom",
        ["left"] = "right",
        ["low"] = "high",
        ["LOW"] = "HIGH",
        ["on"] = "off",
    	["On"] = "Off"
      }
    }
  },

  {
    "stevearc/oil.nvim",
    opts = { }
  },

  {
    "windwp/nvim-ts-autotag",
    opts = { }
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = { }
  },

  {
    "unblevable/quick-scope",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
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
