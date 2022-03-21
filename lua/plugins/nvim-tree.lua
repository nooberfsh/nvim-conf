-- https://github.com/kyazdani42/nvim-tree.lua

require'nvim-tree'.setup {
    update_focused_file = {
        enable      = true,
    },
    actions = {
        open_file = {
            resize_window = true,
            window_picker = {
                enable = false,
            },
        },
    },
}

-- 目录后面添加斜杠 '/'
vim.g.nvim_tree_add_trailing = 1

vim.keybinds.gmap("n", "<A-r>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-r>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<A-r>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)

-- 变大
vim.keybinds.gmap("n", "<A-e>", "<cmd>NvimTreeResize +4<CR>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-e>", "<cmd>NvimTreeResize +4<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<A-e>", "<cmd>NvimTreeResize +4<CR>", vim.keybinds.opts)
-- 变小
vim.keybinds.gmap("n", "<A-E>", "<cmd>NvimTreeResize -4<CR>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-E>", "<cmd>NvimTreeResize -4<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<A-E>", "<cmd>NvimTreeResize -4<CR>", vim.keybinds.opts)
