-- Telescope
local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- Neoformat
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_try_node_exe = 1
