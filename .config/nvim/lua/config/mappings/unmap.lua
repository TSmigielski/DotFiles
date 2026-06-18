local normalUnmaps = {
   "gra",
   "gri",
   "grn",
   "grr",
   "grt",
   "grx"
}

for i, unmap in ipairs(normalUnmaps) do
   vim.keymap.del("n", unmap)
end
