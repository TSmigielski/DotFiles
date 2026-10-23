-- Signature help that can cycle overloads both ways without focusing the
-- popup. Mirrors vim.lsp.buf.signature_help(), which only cycles forward via
-- <C-s> inside the focused float.

local M = {}

local method = "textDocument/signatureHelp"
local ns = vim.api.nvim_create_namespace("config.signature_help")

local state = {
   win = nil,
   signatures = {}, ---@type [vim.lsp.Client, lsp.SignatureInformation][]
   idx = 1,
   ft = nil,
}

local function is_open()
   return state.win ~= nil and vim.api.nvim_win_is_valid(state.win)
end

local function show(update_win)
   local total = #state.signatures
   local client, sig = state.signatures[state.idx][1], state.signatures[state.idx][2]
   local triggers = vim.tbl_get(client.server_capabilities, "signatureHelpProvider", "triggerCharacters")
   local lines, hl = vim.lsp.util.convert_signature_help_to_markdown_lines({ signatures = { sig } }, state.ft, triggers)
   if not lines then
      return
   end

   local opts = { focus_id = method, _update_win = update_win }
   if total > 1 then
      -- Drawn in the top border.
      opts.title = string.format(" Signature Help: %s (%d/%d) ", client.name, state.idx, total)
   end

   local buf, win = vim.lsp.util.open_floating_preview(lines, "markdown", opts)
   if hl then
      vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
      vim.hl.range(buf, ns, "LspSignatureActiveParameter", { hl[1], hl[2] }, { hl[3], hl[4] })
   end
   state.win = win
end

-- If the cursor is on a call's name (e.g. `Foo`, `Foo<T>` or the `(` itself),
-- returns the 0-based byte column just after its `(`, so signature help works
-- without moving into the argument list.
local function call_paren_col(line, col)
   local i = col + 1
   i = (line:find("[^%w_]", i) or #line + 1)
   i = line:find("%S", i) or i
   if line:sub(i, i) == "<" then
      local depth = 0
      for j = i, #line do
         local c = line:sub(j, j)
         depth = depth + (c == "<" and 1 or c == ">" and -1 or 0)
         if depth == 0 then
            i = line:find("%S", j + 1) or j + 1
            break
         end
      end
   end
   if line:sub(i, i) == "(" then
      return i
   end
end

function M.open()
   local bufnr = vim.api.nvim_get_current_buf()
   local cursor = vim.api.nvim_win_get_cursor(0)
   local line = vim.api.nvim_get_current_line()
   local paren_col = call_paren_col(line, cursor[2])

   vim.lsp.buf_request_all(bufnr, method, function(client)
      local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
      if paren_col then
         params.position.character = vim.str_utfindex(line, client.offset_encoding, paren_col, false)
      end
      return params
   end, function(results)
      if vim.api.nvim_get_current_buf() ~= bufnr then
         return
      end

      local signatures, active = {}, 1
      for client_id, r in pairs(results) do
         local client = assert(vim.lsp.get_client_by_id(client_id))
         if r.err then
            vim.notify(client.name .. ": " .. tostring(r.err.code) .. ": " .. r.err.message, vim.log.levels.ERROR)
         elseif r.result and r.result.signatures then
            for i, sig in ipairs(r.result.signatures) do
               sig.activeParameter = sig.activeParameter or r.result.activeParameter
               if (r.result.activeSignature or 0) + 1 == i then
                  active = #signatures + 1
               end
               table.insert(signatures, { client, sig })
            end
         end
      end

      if #signatures == 0 then
         vim.notify("No signature help available", vim.log.levels.INFO)
         return
      end

      state.signatures, state.idx, state.ft = signatures, active, vim.bo[bufnr].filetype
      show()
   end)
end

---@param step integer 1 for next signature, -1 for previous
function M.cycle(step)
   if not is_open() or #state.signatures < 2 then
      return
   end
   state.idx = (state.idx - 1 + step) % #state.signatures + 1
   show(state.win)
end

return M
