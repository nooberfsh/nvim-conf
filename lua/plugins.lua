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

        -- 自动保存
        use {
            'Pocco81/AutoSave.nvim',
            config = function()
                require('plugins.auto-save')
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
                'nvim-telescope/telescope-ui-select.nvim',
            },
            config = function()
                require('plugins.telescope')
            end,
        }

        -- 终端工具
        use {
            "akinsho/toggleterm.nvim",
            branch = 'main',
            config = function()
                require('plugins.toggleterm')
            end,
        }

        --------------------------------------------------------开发相关
        use {
            'numToStr/Comment.nvim',
            tag = 'v0.6',
            config = function()
                require('plugins.comment')
            end,
        }

        --------------------------------------------------------git
        use {
            'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('plugins.diffview')
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
            'simrat39/rust-tools.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'neovim/nvim-lspconfig',
                'mfussenegger/nvim-dap',
            },
        }

        use {
            'tami5/lspsaga.nvim',
            config = function()
                require('plugins.lspsaga')
            end,
        }

        -- 补全
        use {
            "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
            requires = {
                {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                {"hrsh7th/cmp-path"}, -- 路径补全
                {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                {"hrsh7th/cmp-cmdline"}, -- 命令补全
            },
            config = function()
                require("plugins.nvim-cmp")
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

