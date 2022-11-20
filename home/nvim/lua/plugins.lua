return require('packer').startup(function(use)

    use {
        "RRethy/nvim-base16",
        config = "vim.cmd('colorscheme base16-tokyo-night-terminal-dark')"
    }

    use {
        {
            "williamboman/mason.nvim",

            config = function() require('pconf.mason') end

        }, {"williamboman/mason-lspconfig.nvim"},
{"neovim/nvim-lspconfig",
		requires = {
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                config = function()
                    require("lsp_lines").setup()
                    vim.diagnostic.config({virtual_text = false})
                end
            } }
    }
    use {
        'ojroques/nvim-hardline',
        config = function() require('pconf.line') end

    }

    use {'j-hui/fidget.nvim', config = function() require('pconf.fidget') end}

    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require 'alpha.themes.alexis12119_alpha' end
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('pconf.telescope') end,
        tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'}
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        config = function() require('pconf.nvim-tree') end,
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)
