-- https://github.com/nvim-telescope/telescope.nvim
--
-- extenstions:
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
--

require('telescope').setup {
    defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
}

require("telescope").load_extension("ui-select")

-- 查找文件
vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files <CR>", vim.keybinds.opts)
-- 查找文字
vim.keybinds.gmap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", vim.keybinds.opts)
-- 查找特殊符号
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags <CR>", vim.keybinds.opts)
-- 查找最近打开的文件
vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles <CR>", vim.keybinds.opts)
-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks <CR>", vim.keybinds.opts)
