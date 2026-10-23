-- Size limits for LSP floating windows (hover, signature help, diagnostics).
-- Min values never pad past the content, they only stop the window from being
-- squeezed (e.g. by a short split or when cycling signature overloads).
local float_size = { min_width = 40, max_width = 100, min_height = 8, max_height = 25 }

local open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
   opts = opts or {}
   opts.max_width = opts.max_width or float_size.max_width
   opts.max_height = opts.max_height or float_size.max_height

   local bufnr, winnr = open_floating_preview(contents, syntax, opts)
   if not winnr or not vim.api.nvim_win_is_valid(winnr) then
      return bufnr, winnr
   end

   -- Keep markdown markup (``` fences, escapes) hidden on the cursor line too,
   -- otherwise it shows up as soon as the window is focused.
   if syntax == "markdown" then
      vim.wo[winnr].concealcursor = "nc"
   end

   local cfg = vim.api.nvim_win_get_config(winnr)
   if cfg.relative == "" or cfg.relative == "mouse" then
      return bufnr, winnr
   end

   local border = type(cfg.border) == "table" and cfg.border or {}
   local border_rows = (border[2] and border[2] ~= "" and 1 or 0) + (border[6] and border[6] ~= "" and 1 or 0)
   local border_cols = (border[4] and border[4] ~= "" and 1 or 0) + (border[8] and border[8] ~= "" and 1 or 0)

   -- Width: fit the content, clamped to [min, max] and the editor width.
   local content_width = 0
   for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
      content_width = math.max(content_width, vim.fn.strdisplaywidth(line))
   end
   -- Make sure a border title fits too.
   local title_width = 0
   for _, chunk in ipairs(type(cfg.title) == "table" and cfg.title or {}) do
      title_width = title_width + vim.fn.strdisplaywidth(chunk[1])
   end
   content_width = math.max(content_width, title_width)
   local width = math.min(content_width, opts.width or float_size.max_width, vim.o.columns - border_cols)
   width = math.max(width, math.min(float_size.min_width, content_width), 1)
   vim.api.nvim_win_set_config(winnr, { width = width })

   -- Height: wrapped (and conceal-aware) content height, clamped to [min, max]
   -- and to the screen space on the side of the cursor the window opened on.
   local text_height = vim.api.nvim_win_text_height(winnr, {}).all
   local height = math.max(text_height, 1)
   height = math.min(height, opts.height or float_size.max_height)
   height = math.max(height, math.min(float_size.min_height, text_height))

   local cursor = vim.api.nvim_win_get_cursor(0)
   local screen_row = vim.fn.screenpos(0, cursor[1], cursor[2] + 1).row
   if screen_row > 0 then
      local available
      if cfg.anchor:sub(1, 1) == "N" then
         available = vim.o.lines - vim.o.cmdheight - screen_row - border_rows
      else
         available = screen_row - 1 - border_rows
      end
      height = math.min(height, math.max(available, 1))
   end
   vim.api.nvim_win_set_config(winnr, { height = height })

   return bufnr, winnr
end
