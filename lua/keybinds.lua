-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- leader 键设置为空格
vim.g.mapleader = ';'

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半页
vim.keybinds.gmap("n", "<C-u>", "15k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "15j", vim.keybinds.opts)

-- 窗口切换
vim.keybinds.gmap('n', '<C-h>', '<C-w>h', vim.keybinds.opts)
vim.keybinds.gmap('n', '<C-j>', '<C-w>j', vim.keybinds.opts)
vim.keybinds.gmap('n', '<C-k>', '<C-w>k', vim.keybinds.opts)
vim.keybinds.gmap('n', '<C-l>', '<C-w>l', vim.keybinds.opts)

vim.keybinds.gmap('i', '<C-h>', '<C-\\><C-N><C-w>h', vim.keybinds.opts)
vim.keybinds.gmap('i', '<C-j>', '<C-\\><C-N><C-w>j', vim.keybinds.opts)
vim.keybinds.gmap('i', '<C-k>', '<C-\\><C-N><C-w>k', vim.keybinds.opts)
vim.keybinds.gmap('i', '<C-l>', '<C-\\><C-N><C-w>l', vim.keybinds.opts)

vim.keybinds.gmap('t', '<esc>', '<C-\\><C-N>', vim.keybinds.opts)
vim.keybinds.gmap('t', '<C-h>', '<C-\\><C-N><C-w>h', vim.keybinds.opts)
vim.keybinds.gmap('t', '<C-j>', '<C-\\><C-N><C-w>j', vim.keybinds.opts)
vim.keybinds.gmap('t', '<C-k>', '<C-\\><C-N><C-w>k', vim.keybinds.opts)
vim.keybinds.gmap('t', '<C-l>', '<C-\\><C-N><C-w>l', vim.keybinds.opts)
