--- DAP ---
vim.keymap.set("n", "<F4>", ":DapToggleBreakpoint<CR>", Desc("Toggle breakpoint"))
vim.keymap.set("n", "<F5>", ":DapContinue<CR>", Desc("Continue debugging"))
vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", Desc("Terminate debugging"))
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", Desc("Step over"))
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", Desc("Step into"))
vim.keymap.set("n", "<S-F11>", ":DapStepOut<CR>", Desc("Step out"))
-- require("osv").launch({port = 8086})

--- Noice ---
vim.keymap.set("n", "<leader>nh", ":NoicePick<CR>", Desc("Notification history"))
vim.keymap.set("n", "<leader>nl", ":NoiceLast<CR>", Desc("Last notification"))
vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<CR>", Desc("Dismiss notifications"))
vim.keymap.set("n", "<leader>ne", ":NoiceErrors<CR>", Desc("Show last errors"))

--- FZF --- 
local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>f", fzf.global, Desc("FZF combo"))
vim.keymap.set("n", "<leader>g", fzf.live_grep_native, Desc("FZF live grep"))
vim.keymap.set("n", "<leader>r", fzf.resume, Desc("FZF resume"))
vim.keymap.set("n", "<leader>a", ":FzfLua<Cr>", Desc("FZF search mode"))

--- Trouble --- 
local trouble = require("trouble")
vim.keymap.set("n", "<leader>tt", ":Trouble diagnostics toggle<CR>", Desc("Toggle diagnostics"))
vim.keymap.set("n", "<leader>ts", function ()
   if (trouble.is_open("lsp")) then
      trouble.close("lsp")
      trouble.open("symbols")
      return
   end
   trouble.toggle("symbols")
end, Desc("Toggle symbols"))

vim.keymap.set("n", "<leader>tl", function ()
   local lsp = {
      mode = "lsp",
      win = {
         position = "right"
      }
   }
   if (trouble.is_open("symbols")) then
      trouble.close("symbols")
      trouble.open(lsp)
      return
   end
   trouble.toggle(lsp)
end, Desc("Toggle definitions"))

vim.keymap.set("n", "<leader>tc", function ()
   trouble.close("lsp")
   trouble.close("symbols")
end, Desc("Close windows"))

--- VimArduino ---
local inoGroup = vim.api.nvim_create_augroup("ino_autocommands", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
   group = inoGroup,
   pattern = "arduino",
   callback = function()
      vim.keymap.set("n", "<leader>ai", "<cmd>ArduinoInfo<CR>", Desc("Display VimArduino plugin info"))
      vim.keymap.set("n", "<leader>aa", "<cmd>ArduinoAttach<CR>", Desc("Automatically attach to board"))
      vim.keymap.set("n", "<leader>ab", "<cmd>ArduinoChooseBoard<CR>", Desc("Choose arduino board"))
      vim.keymap.set("n", "<leader>ar", "<cmd>ArduinoChooseProgrammer<CR>", Desc("Choose arduino programmer"))
      vim.keymap.set("n", "<leader>ap", "<cmd>ArduinoChoosePort<CR>", Desc("Choose arduino port"))
      vim.keymap.set("n", "<leader>av", "<cmd>ArduinoVerify<CR>", Desc("Build the sketch"))
      vim.keymap.set("n", "<leader>au", "<cmd>ArduinoUpload<CR>", Desc("Build and upload the sketch"))
      vim.keymap.set("n", "<leader>as", "<cmd>ArduinoSerial<CR>", Desc("Connect to the board over serial"))
      vim.keymap.set("n", "<leader>al", "<cmd>ArduinoUploadAndSerial<CR>", Desc("Build, upload, and connect to the board over serial"))
   end,
})

--- Other ---
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>c", ":CccPick<CR>", Desc("Color picker"))
