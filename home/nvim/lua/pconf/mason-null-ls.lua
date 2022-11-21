require("mason").setup()
require("null-ls").setup()
require("mason-null-ls").setup({
	ensure_installed = { "autopep8", "beautysh", "shellcheck" },
	automatic_installation = true,
	automatic_setup = true
})
require 'mason-null-ls'.setup_handlers()
