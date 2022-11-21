require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "rnix", "bashls" }
})
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
		}
	end,
}

require 'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			},
			telemetry = { enable = false }
		}
	}
}
