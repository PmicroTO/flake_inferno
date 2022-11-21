require("mason").setup()
require("null-ls").setup()
require("mason-null-ls").setup({
	ensure_installed = { "autopep8", "beautysh" },
	automatic_installation = false,
	automatic_setup = true
})
require 'mason-null-ls'.setup_handlers()
