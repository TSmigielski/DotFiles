local buffers = { }
local index = 1;

local function GotoIndex(newIndex)
   if (index == newIndex) then
      return
   elseif (newIndex) then
      index = newIndex
   end
   vim.cmd("LualineBuffersJump " .. index)
end

local IsBufListed = function(bufNr)
   return vim.api.nvim_get_option_value("buflisted", { buf = bufNr })
end

vim.api.nvim_create_autocmd("BufReadPre", {
   callback = function(args)
      if (IsBufListed(args.buf)) then
         if not (vim.tbl_contains(buffers, args.buf)) then
            table.insert(buffers, args.buf)
         end
         index = #buffers
      end
   end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
   callback = function(args)
      if (IsBufListed(args.buf)) then
         -- Find (& set) the index
         for i, buf in ipairs(buffers) do
            if (buf == args.buf) then
               index = i
               return
            end
         end

         -- Fallback for race conditions (if buffer wasn't added in BufReadPre)
         table.insert(buffers, args.buf)
         index = #buffers
      end
   end
})

vim.api.nvim_create_autocmd("BufDelete", {
   callback = function(args)
      buffers = vim.tbl_filter(function(buf)
         return vim.api.nvim_buf_is_valid(buf) and buf ~= args.buf
      end, buffers)
      index = math.min(index, #buffers)
   end
})

vim.keymap.set("n", "<leader><leader>", function()
   local input = vim.fn.input("Enter buffer index: ")
   local value = tonumber(input)
   if (value) then
      GotoIndex(value)
   else
      print("Inavlid input, number expected.")
   end
end, Desc("Goto buffer"))

vim.keymap.set("n", "<TAB>", function()
   index = index + 1
   if (index > #buffers) then
      index = 1
   end
   GotoIndex()
end, Desc("Next buffer"))

vim.keymap.set("n", "<S-TAB>", function()
   index = index - 1
   if (index < 1) then
      index = #buffers
   end
   GotoIndex()
end, Desc("Previous buffer"))
