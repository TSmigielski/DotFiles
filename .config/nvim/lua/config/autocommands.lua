-- Open in last position
vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = { "*" },
   callback = function()
      if (vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$")) then
         vim.api.nvim_exec("normal! g'\"", false)
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
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FocusGained" }, {
   group = "CursorLine",
   callback = function()
      -- Check if the current window is a floating window
      if (vim.api.nvim_win_get_config(0).relative == "") then
         vim.wo.cursorline = true
      end
   end
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
   group = "CursorLine",
   callback = function()
      vim.wo.cursorline = false
   end
})

-- Insert ; after )
vim.keymap.set('i', ';', function()
   local line = vim.api.nvim_get_current_line()
   local col = vim.api.nvim_win_get_cursor(0)[2]
   local next_char = line:sub(col + 1, col + 1)

   if next_char == ')' then
      return '<Right>;' -- Also return to normal mode
   else
      return ';'
   end
end, { expr = true, noremap = true })
