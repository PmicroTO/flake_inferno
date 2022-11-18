return require('packer').startup(function(use)

    use {
        "RRethy/nvim-base16",
        config = "vim.cmd('colorscheme base16-gruvbox-dark-soft')"
    }

    use {
        "williamboman/mason.nvim",

        config = function() require("mason").setup() end,
        requires = {
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    require("mason-lspconfig").setup()

                end
            }, {'neovim/nvim-lspconfig'}, {'mfussenegger/nvim-dap'},
            {'jose-elias-alvarez/null-ls.nvim'}
        }
    }

use 'beauwilliams/statusline.lua'


end)
