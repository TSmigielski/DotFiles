-- Add cmp-nvim-lsp capabilities to all servers
vim.lsp.config("*", {
   capabilities = require("cmp_nvim_lsp").default_capabilities()
})

-- Server specific overrides
vim.lsp.config("avalonia", {
   cmd = { "avalonia-ls" },
   filetypes = { "xml" },
   root_markers = { ".csproj", ".git" }
})

-- Non Mason managed servers
vim.lsp.enable("avalonia")

vim.api.nvim_create_autocmd("LspAttach", {
   desc = "LSP actions",
   callback = function(event)
      local function getOpts(desc)
         return { buffer = event.buf, desc = desc }
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, getOpts("Quick documentation"))
      vim.keymap.set("n", "<AS-k>", vim.diagnostic.open_float, getOpts("Diagnostics window"))
      vim.keymap.set({ "n", "i" }, "<A-s>", vim.lsp.buf.signature_help, getOpts("Signature help"))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, getOpts("Goto definition"))
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, getOpts("Goto declaration"))
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, getOpts("Goto implementation"))
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, getOpts("Goto type definition"))
      vim.keymap.set("n", "gr", vim.lsp.buf.references, getOpts("Goto references (in quickfix)"))
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, getOpts("LSP rename"))
      vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, getOpts("LSP format"))
      vim.keymap.set("n", "<A-CR>", vim.lsp.buf.code_action, getOpts("LSP code actions"))
   end,
})

-- Better CodeLens hl.
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#717171", italic = true })

-- Link non existent highlight groups for c# tokens.
vim.api.nvim_set_hl(0, "@lsp.type.extensionMethod.cs", { link = "@function.method" })
vim.api.nvim_set_hl(0, "@lsp.type.recordClass.cs", { link = "@type" })

-- CMP --
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

-- Base mappings
local mappings = {
   ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = "select" }), { "i", "c" }),
   ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = "select" }), { "i", "c" }),
   ["<Tab>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
   ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
   ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
   ["<C-q>"] = cmp.mapping(cmp.mapping.close_docs(), { "i", "c" }),
   ["<CS-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
   ["<CS-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" })
}

cmp.setup({
   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "easy-dotnet" },
      { name = "async_path" }
   }),
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end
   },
   mapping = mappings,
   preselect = "item",
   completion = {
      completeopt = "menu,menuone,noinsert"
   }
})

-- Use buffer source for "/" and "?"
cmp.setup.cmdline({ "/", "?" }, {
   mapping = mappings,
   sources = {
      { name = "buffer" }
   }
})

-- Use cmdline & path source for ":"
cmp.setup.cmdline(":", {
   mapping = mappings,
   sources = cmp.config.sources(
      { { name = "path" } }, { {
         name = "cmdline",
         option = {
            ignore_cmds = { "Man", "!" }
         }
      } }),
   ---@diagnostic disable-next-line: missing-fields
   matching = { disallow_symbol_nonprefix_matching = false }
})

-- Insert '(' after confirming
local autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", autopairs.on_confirm_done())


-- Handles Roslyn's "completionComplexEdit" completions, which nvim-cmp
-- doesn't natively support. Roslyn sends an empty textEdit and instead
-- stashes the real edit inside `item.command.arguments`. This hooks into
-- cmp's confirm_done event, detects that shape, and applies the edit
-- directly to the buffer.
--
-- Also wires up nvim-autopairs' own confirm_done handler, but only for
-- completions that AREN'T a Roslyn complex edit -- autopairs doesn't know
-- about this custom command and would just be acting on stale/incomplete
-- text if it ran on those too.

local autopairs_on_confirm_done = autopairs.on_confirm_done()
cmp.event:on("confirm_done", function(event)
   local entry = event.entry
   local item = entry:get_completion_item()

   local command = item.command
   if not command or command.command ~= "roslyn.client.completionComplexEdit" then
      -- Not a Roslyn complex edit -- let autopairs handle it as normal.
      autopairs_on_confirm_done(event)
      return
   end

   -- The edit payload lives somewhere in command.arguments. Find the
   -- argument that actually looks like a TextEdit (has range + newText),
   -- rather than hardcoding an index, since the position may not be stable
   -- across Roslyn versions.
   local edit
   for _, arg in ipairs(command.arguments or {}) do
      if type(arg) == "table" and arg.range and arg.newText ~= nil then
         edit = arg
         break
      end
   end

   if not edit then
      vim.notify(
         "[roslyn complex edit] command fired but no TextEdit-shaped argument found",
         vim.log.levels.WARN
      )
      return
   end

   local bufnr = entry.context and entry.context.bufnr or vim.api.nvim_get_current_buf()

   -- Apply the real edit. This is a standard LSP TextEdit, so we can use
   -- nvim's built-in applier directly.
   vim.lsp.util.apply_text_edits({ edit }, bufnr, "utf-16")

   -- Move the cursor to the end of the inserted text, since apply_text_edits
   -- doesn't do this for us and cmp's own (empty) insert already left the
   -- cursor in roughly the right spot, but let's be precise about it.
   local lines = vim.split(edit.newText, "\n", { plain = true })
   local end_line = edit.range.start.line + (#lines - 1)
   local end_col
   if #lines == 1 then
      end_col = edit.range.start.character + #lines[1]
   else
      end_col = #lines[#lines]
   end
   vim.api.nvim_win_set_cursor(0, { end_line + 1, end_col })
end)
