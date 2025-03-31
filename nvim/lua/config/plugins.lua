-- Telescope
local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- Open telescope items in Trouble
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open
telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
  },
})
