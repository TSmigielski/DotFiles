vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], Desc("Search & replace the word that the cursor is on"))

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Add execute permission to file in buffer" })

vim.keymap.set({"n","v"}, "<Space>", "<Nop>", { silent = true }) -- Disable space action (leave it for leader)

vim.keymap.set("v", "/", '"vy/<C-r>v<CR>', Desc("Search selected text"))

vim.keymap.set("n", "<leader>T", function()
   local input = vim.fn.input("Enter tab width (or hit enter for 3): ")
   local value = tonumber(input)

   if (not value) then
      value = 3
   end

   vim.opt.tabstop = 8
   vim.opt.softtabstop = value
   vim.opt.shiftwidth = value
   vim.opt.expandtab = true
   print("Tab width set to: " .. value)
end, Desc("Set tab width"))
