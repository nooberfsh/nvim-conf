-- https://github.com/nvim-pack/nvim-spectre

require('spectre').setup {

}

-- 全项目替换
vim.keybinds.gmap("n", "<leader>rp", "<cmd>lua require('spectre').open()<CR>", vim.keybinds.opts)
-- 只替换当前文件
vim.keybinds.gmap("n", "<leader>rf", "viw:lua require('spectre').open_file_search()<CR>", vim.keybinds.opts)
-- 全项目中搜索当前单词
vim.keybinds.gmap("n", "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", vim.keybinds.opts)
