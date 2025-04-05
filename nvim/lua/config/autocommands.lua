-- Open in last position
vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = {"*"},
   callback = function()
      if (vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$")) then
         vim.api.nvim_exec("normal! g'\"",false)
      end
   end
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
   group = highlight_group,
   pattern = "*",
})

-- Auto-show/hide cursorline on window enter/exit
vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
   group = "CursorLine",
   callback = function()
      -- Check if the current window is a floating window
      if (vim.api.nvim_win_get_config(0).relative == "") then
         vim.wo.cursorline = true
      end
   end
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
   group = "CursorLine",
   callback = function()
      vim.wo.cursorline = false
   end
})

-- Codelens
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
   callback = vim.lsp.codelens.refresh
})
