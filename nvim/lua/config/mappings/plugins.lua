--- DAP ---
vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", Desc("Toggle breakpoint"))
vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", Desc("Continue debugging"))
vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", Desc("Terminate debugging"))
vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", Desc("Step over"))

--- Noice ---
vim.keymap.set("n", "<leader>nh", ":NoicePick<CR>", Desc("Notification history"))
vim.keymap.set("n", "<leader>nl", ":NoiceLast<CR>", Desc("Last notification"))
vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<CR>", Desc("Dismiss notifications"))
vim.keymap.set("n", "<leader>ne", ":NoiceErrors<CR>", Desc("Show last errors"))

--- Telescope --- 
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
   -- Check if in git repository
   local inGit = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
   if (vim.v.shell_error == 0) then
      telescope.git_files()
   else
      telescope.find_files()
   end
end, Desc("Find file (Telescope)"))
vim.keymap.set("n", "<leader>bb", telescope.buffers, Desc("Find open buffer (Telescope)"))
vim.keymap.set("n", "<leader>fg", telescope.live_grep, Desc("Live grep (Telescope)"))
vim.keymap.set("n", "<leader>/", function()
   telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
   })
end, Desc("Find in current buffer (Telescope)"))
vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", Desc("File browser (Telescope)"))

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
vim.keymap.set("n", "<leader>fp", ":Prettier<CR>", Desc("Format with Prettier"))
vim.keymap.set("n", "<leader>fc", ":ClangFormat<CR>", Desc("Format with clang-format"))
