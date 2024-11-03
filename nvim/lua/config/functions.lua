-- Open in last position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})

-- Higlight on yank
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
        vim.wo.cursorline = true
    end
})
vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    group = "CursorLine",
    callback = function()
        vim.wo.cursorline = false
    end
})
