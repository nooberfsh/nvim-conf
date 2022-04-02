-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
    options = {
        theme = 'onedark',
    },

    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        }
    },
}
