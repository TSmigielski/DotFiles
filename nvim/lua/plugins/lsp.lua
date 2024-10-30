-- Mason
require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end
  }
})

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

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", getOpts("Quick documentation"))
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", getOpts("Goto definition"))
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", getOpts("Goto declaration"))
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", getOpts("Goto implementation"))
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", getOpts("Goto type definition"))
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", getOpts("See references"))
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", getOpts("See signature"))
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", getOpts("LSP rename"))
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", getOpts("LSP format"))
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", getOpts("LSP code actions"))
  end,
})

-- Autocompletion
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

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
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-l>"] = cmp.mapping.confirm(),
    ["<C-Space>"] = cmp.mapping.complete()
  }),
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
