vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], Desc("Search & replace the word that the cursor is on"))

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Add execute permission to file in buffer" })

vim.keymap.set({"n","v"}, "<Space>", "<Nop>", { silent = true }) -- Disable space action (leave it for leader)

vim.keymap.set("v", "/", '"vy/<C-r>v<CR>', Desc("Search selected text"))

vim.keymap.set("n", "<leader>lg", '"pyi":!xdg-open https://github.com/<C-r>p<CR>', Desc("Open in github"))

vim.keymap.set("n", "<leader>T", function()
   local input = vim.fn.input("Enter tab width (or hit enter for 3): ")
   local value = tonumber(input)

   if (not value) then
      value = 3
   end

   vim.opt.tabstop = value
   vim.opt.softtabstop = -1
   vim.opt.shiftwidth = 0
   vim.opt.expandtab = true
   print("Tab width set to: " .. value)
end, Desc("Set tab width"))

-- incremental selection treesitter/lsp
vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
