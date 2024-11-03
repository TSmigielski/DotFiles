-- Telescope
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  }
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- Load telescope file browser
require("telescope").load_extension "file_browser"

-- Neoformat
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_try_node_exe = 1
