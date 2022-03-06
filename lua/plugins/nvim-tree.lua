-- https://github.com/kyazdani42/nvim-tree.lua

require'nvim-tree'.setup {
}

-- 目录后面添加斜杠 '/'
vim.g.nvim_tree_add_trailing = 1
vim.keybinds.gmap("n", "<leader>1", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
