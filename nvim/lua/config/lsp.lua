-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
   "force",
   lspconfig_defaults.capabilities,
   require("cmp_nvim_lsp").default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
   desc = "LSP actions",
   callback = function(event)
      local function getOpts(desc)
         return { buffer = event.buf, desc = desc }
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, getOpts("Quick documentation"))
      vim.keymap.set("n", "<AS-k>", vim.diagnostic.open_float, getOpts("Diagnostics window"))
      vim.keymap.set({"n", "i"}, "<A-s>", vim.lsp.buf.signature_help, getOpts("Signature help"))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, getOpts("Goto definition"))
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, getOpts("Goto declaration"))
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, getOpts("Goto type definition"))
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, getOpts("LSP rename"))
      vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, getOpts("LSP format"))
      vim.keymap.set("n", "<A-CR>", vim.lsp.buf.code_action, getOpts("LSP code actions"))
   end,
})

-- CMP --
local cmp = require("cmp")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

-- Base mappings
local mappings = {
   ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = "select" }), { "i", "c" }),
   ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = "select" }), { "i", "c" }),
   ["<C-l>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
   ["<Tab>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
   ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
   ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
   ["<C-q>"] = cmp.mapping(cmp.mapping.close_docs(), { "i", "c" }),
   ["<CS-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
   ["<CS-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),

   -- Confirm & insert dot
   ["."] = cmp.mapping(function(fallback)
      if cmp.visible() then
         cmp.confirm({ select = true })
         vim.fn.feedkeys(".", "n")
      else
         fallback()
      end
   end, { "i", "c" })
}

cmp.setup({
   sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "luasnip" }
   },
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end
   },
   mapping = mappings,
   preselect = "item",
   completion = {
      completeopt = "menu,menuone,noinsert"
   },
   formatting = {
      expandable_indicator = true,
      fields = { "abbr", "kind", "menu" },
      format = lspkind.cmp_format({
         mode = "symbol",
         ellipsis_char = "...",
         show_labelDetails = true
      })
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
      {{name = "path"}}, {{
         name = "cmdline",
         option = {
            ignore_cmds = { "Man", "!" }
         }
      }}),
   ---@diagnostic disable-next-line: missing-fields
   matching = { disallow_symbol_nonprefix_matching = false }
})

-- Insert '(' after confirming
local autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
   "confirm_done",
   autopairs.on_confirm_done()
)
