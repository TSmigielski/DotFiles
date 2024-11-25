return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
	"github:mason-org/mason-registry",
	"github:Crashdummyy/mason-registry"
      }
    }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
	function(server_name)
	  require("lspconfig")[server_name].setup({})
	end,

	-- arduino_language_server = function()
	--   require("lspconfig").arduino_language_server.setup({
	--     on_attach = function (client, bufnr)
	--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fc", ":ClangFormat<CR>", { desc = "clang-format" })
	--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fv", ":ClangFormatAutoToggle<CR>", { desc = "clang-format auto toggle" })
	--
	--       -- Enable auto-formatting by default
	--       vim.api.nvim_buf_call(bufnr, vim.cmd("ClangFormatAutoEnable"))
	--     end
	--   })
	-- end
      }
    }
  }
}
