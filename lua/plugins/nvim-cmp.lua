-- https://github.com/hrsh7th/nvim-cmp
--
-- 下面是补全 source
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
--

local lspkind = require("lspkind")

local cmp = require("cmp")

cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },

    sources = cmp.config.sources {
        {name = "vsnip"},
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "buffer"},
        {name = "cmdline"},
    },

    -- 格式化补全菜单
    formatting = {
        format = lspkind.cmp_format{
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end,
        }
    },

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm(),
    },

    cmp.setup.cmdline('/',
        {
            sources = {
                {name = 'buffer'}
            }
        }
    ),

    cmp.setup.cmdline(':',
        {
            sources = cmp.config.sources(
                {
                    { name = 'path' }
                },
                {
                    { name = 'cmdline' }
                }
            )
        }
    )
}

