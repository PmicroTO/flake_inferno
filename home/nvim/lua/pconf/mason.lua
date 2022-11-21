require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "rnix" },
})
require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
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
