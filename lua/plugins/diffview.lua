-- https://github.com/sindrets/diffview.nvim

require('diffview').setup {
    hooks = {
        diff_buf_read = function(bufnr)
            vim.keybinds.bmap(bufnr, "n", "<esc>", "<cmd>DiffviewClose<CR>", vim.keybinds.opts)
        end,
        view_opened = function(view)
            vim.keybinds.bmap(0, "n", "<esc>", "<cmd>DiffviewClose<CR>", vim.keybinds.opts)
        end,
    }
}

vim.keybinds.gmap("n", "<leader>dd", "<cmd>DiffviewOpen<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", vim.keybinds.opts)

