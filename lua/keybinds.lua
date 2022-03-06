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

