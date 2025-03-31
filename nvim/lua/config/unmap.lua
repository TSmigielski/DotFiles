local normalUnmaps = {
    "grr",
    "gri",
    "gra",
    "grn"
}

for i, unmap in ipairs(normalUnmaps) do
    vim.keymap.del("n", unmap)
end
