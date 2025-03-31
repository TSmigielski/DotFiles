-- Helper function for setting descriptions
local function Desc (desc)
   return { desc = desc }
end

-- Ctrl+HJKL movement
vim.keymap.set({"i","n"}, "<C-h>", "<Left>")
vim.keymap.set({"i","n"}, "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<C-o>g<Down>")
vim.keymap.set("i", "<C-k>", "<C-o>g<Up>")
vim.keymap.set("n", "<C-j>", "g<Down>")
vim.keymap.set("n", "<C-k>", "g<Up>")

-- Move between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Keep the screen centered when using these motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", Desc("Move selected text down a line"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", Desc("Move selected text up a line"))

-- Register shenanigans
vim.keymap.set("x", "<leader>p", [["_dP]], Desc("Paste without losing register"))
vim.keymap.set({"n","v"}, "<leader>y", [["+y]], Desc("Yank into system clipboard"))
vim.keymap.set({"n","v"}, "<leader>d", [["_d]], Desc("Delete to discard register"))

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- QOL
vim.keymap.set("i", "<C-c>", "<esc>") -- Ctrl + C == Esc
vim.keymap.set("n", "Q", "<nop>") -- Disable Q
vim.keymap.set("n", "J", "mzJ`z") -- Keep cursor in place during J
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], Desc("Search & replace the word that the cursor is on"))
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Add execute permission to file in buffer" })
vim.keymap.set({"n","v"}, "<Space>", "<Nop>", { silent = true }) -- Disable space action (leave it for leader)
vim.keymap.set("n", "<leader>fp", ":Prettier<CR>", Desc("Format with Prettier"))
vim.keymap.set("n", "<leader>fc", ":ClangFormat<CR>", Desc("Format with clang-format"))
vim.keymap.set("n", "gh", ":help <C-r><C-w><CR>", Desc("Goto help files (horizontal)"))
vim.keymap.set("n", "gvh", ":vert help <C-r><C-w><CR>", Desc("Goto help files (vertical)"))
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

vim.keymap.set("n", "<leader>b", function()
   local input = vim.fn.input("Enter buffer index: ")
   local value = tonumber(input)
   if (value) then
      vim.cmd("LualineBuffersJump " .. value)
   else
      print("Inavlid input, number expected.")
   end
end, Desc("Goto buffer"))

-- Telescope
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
vim.keymap.set("n", "<leader><leader>", telescope.buffers, Desc("Find open buffer (Telescope)"))
vim.keymap.set("n", "<leader>fg", telescope.live_grep, Desc("Live grep (Telescope)"))
vim.keymap.set("n", "<leader>/", function()
   telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
   })
end, Desc("Find in current buffer (Telescope)"))
vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", Desc("File browser (Telescope)"))

-- Trouble
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

-- VimArduino
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

-- Other plugins
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
