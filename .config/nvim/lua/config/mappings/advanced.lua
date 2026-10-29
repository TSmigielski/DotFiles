vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], Desc("Search & replace the word that the cursor is on"))

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
vim.keymap.set({ "n", "x", "o" }, "<A-S-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-S-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- Positions <A-o> jumped from, so <A-i> can retrace them. Only valid while
-- the cursor is still where the last jump left it.
local outer_jumps = { buf = nil, landing = nil, stack = {} }

local function at_landing()
	local cursor = vim.api.nvim_win_get_cursor(0)
	return outer_jumps.buf == vim.api.nvim_get_current_buf()
		and outer_jumps.landing ~= nil
		and outer_jumps.landing[1] == cursor[1]
		and outer_jumps.landing[2] == cursor[2]
end

local function jump_to(pos)
	vim.cmd("normal! m'") -- Add to jumplist, so <C-o> goes back
	vim.api.nvim_win_set_cursor(0, pos)
	outer_jumps.buf = vim.api.nvim_get_current_buf()
	outer_jumps.landing = pos
end

-- Jump to the start of the enclosing treesitter node (argument -> call -> statement -> block -> function -> class)
vim.keymap.set({ "n", "x" }, "<A-o>", function()
	local node = vim.treesitter.get_node({ ignore_injections = false })
	if not node then
		vim.cmd("normal! " .. vim.v.count1 .. "[{")
		return
	end

	local cursor = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor[1] - 1, cursor[2]
	for _ = 1, vim.v.count1 do
		-- Skip parents that start at the current position (they wouldn't move the cursor)
		-- and bracket nodes like argument lists and blocks (their owner is more useful)
		while node do
			local start_row, start_col = node:start()
			local first_char = vim.api.nvim_buf_get_text(0, start_row, start_col, start_row, start_col + 1, {})[1]
			if (start_row ~= row or start_col ~= col) and not first_char:match("[%(%[{<]") then
				row, col = start_row, start_col
				break
			end
			node = node:parent()
		end
		if not node then
			break
		end
		node = node:parent()
	end

	if row == cursor[1] - 1 and col == cursor[2] then
		return -- Already at the outermost node
	end
	if not at_landing() then
		outer_jumps.stack = {}
	end
	table.insert(outer_jumps.stack, cursor)
	jump_to({ row + 1, col })
end, { desc = "Jump to start of outer treesitter node" })

-- Retrace <A-o> jumps back inwards
vim.keymap.set({ "n", "x" }, "<A-i>", function()
	if not at_landing() then
		outer_jumps.stack = {}
		return
	end
	for _ = 1, vim.v.count1 do
		local pos = table.remove(outer_jumps.stack)
		if not pos then
			break
		end
		jump_to(pos)
	end
end, { desc = "Jump back to inner position (undo <A-o>)" })
