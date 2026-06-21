return {
   "stevearc/vim-arduino",
   config = function()
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
            vim.keymap.set("n", "<leader>al", "<cmd>ArduinoUploadAndSerial<CR>",
               Desc("Build, upload, and connect to the board over serial"))
         end,
      })
   end
}
