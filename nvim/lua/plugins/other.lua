return {
  {
    "sbdchd/neoformat",
    init = function ()
      vim.g.neoformat_basic_format_align = 1
      vim.g.neoformat_basic_format_trim = 1
      vim.g.neoformat_try_node_exe = 1
    end
  },

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
  }
}
