-- 
return require('packer').startup(function(use)
    vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

    use {
        "RRethy/nvim-base16",
        config = "vim.cmd('colorscheme base16-tomorrow-night-eighties')"
    }

    use {

        {
            "williamboman/mason.nvim",
            config = function() require('pconf.mason') end

        }, "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"
    }

    use {
        'ojroques/nvim-hardline',

        config = function() require('pconf.line') end

    }

    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require'alpha'.setup(require'alpha.themes.startify_custom'.config)
        end
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

end)
