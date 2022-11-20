
return require('packer').startup(function(use)

use {
		{"williamboman/mason.nvim",

            config = function() require('pconf.mason') end

		},



		{"williamboman/mason-lspconfig.nvim",

			after = 'mason.nvim',
requires ={"neovim/nvim-lspconfig",
			after = 'mason-lspconfig.nvim',
            requires = {
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                config = function()
                    require("lsp_lines").setup()
                    vim.diagnostic.config({virtual_text = false})
                end
            }},

		},

		{    "jayp0521/mason-null-ls.nvim",
			after = 'null-ls.nvim',




requires = { "jose-elias-alvarez/null-ls.nvim",

				after = 'mason.nvim'
			}
		}


}


end)
