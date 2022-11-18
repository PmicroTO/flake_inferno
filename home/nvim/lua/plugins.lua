return require('packer').startup(function(use)

    use {
        "RRethy/nvim-base16",
        config = "vim.cmd('colorscheme base16-tomorrow-night-eighties')"
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

    use {
        'nvim-lualine/lualine.nvim',
        config = function()

            require('lualine').setup {
                options = {
                    theme = base16,
                    component_separators = '|',
                    section_separators = {left = '', right = ''}
                },
                sections = {
                    lualine_a = {
                        {'mode', separator = {left = ''}, right_padding = 2}
                    },
                    lualine_b = {'filename', 'branch'},
                    lualine_c = {'fileformat'},
                    lualine_x = {},
                    lualine_y = {'filetype', 'progress'},
                    lualine_z = {
                        {
                            'location',
                            separator = {right = ''},
                            left_padding = 2
                        }
                    }
                },
                inactive_sections = {
                    lualine_a = {'filename'},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {'location'}
                },
                tabline = {},
                extensions = {}
            }
        end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }

use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify_custom'.config)
    end
}

end)
