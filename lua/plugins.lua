-- https://github.com/wbthomason/packer.nvim

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup {
    function(use)
        -- 包管理器
        use 'wbthomason/packer.nvim'

        -- 目录树
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
            config = function()
                require("plugins.nvim-tree")
            end,
        }

        -- 自动添加括号
        use {
            'windwp/nvim-autopairs',
            config = function()
                require('plugins.nvim-autopairs')
            end,
        }

        -- 文本替换
        use {
            'windwp/nvim-spectre',
            requires = {
                'nvim-lua/plenary.nvim',
            },
            config = function()
                require('plugins.spectre')
            end,
        }

        -- 搜索/预览工具,包括:文件,字符串,mark,任何你能想到的东西
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
            },
            config = function()
                require('plugins.telescope')
            end,
        }

        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require('plugins.toggleterm')
            end,
        }

        --------------------------------------------------------lsp

        use {
            'neovim/nvim-lspconfig',
            config = function()
                require('plugins.nvim-lspconfig')
            end,
        }

        use {
            'williamboman/nvim-lsp-installer',
            config = function()
                require('plugins.nvim-lsp-installer')
            end,
        }

        use {
            'tami5/lspsaga.nvim',
            config = function()
                require('plugins.lspsaga')
            end,
        }

        --------------------------------------------------------主题和颜色

        use {
            'navarasu/onedark.nvim',
            config = function()
                require('plugins.onedark')
            end,
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                'navarasu/onedark.nvim',
            },
            config = function()
                require('plugins.lualine')
            end,
        }

        use {
            'j-hui/fidget.nvim',
            config = function()
                require('plugins.fidget')
            end,
        }
    end,

    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    },
}

